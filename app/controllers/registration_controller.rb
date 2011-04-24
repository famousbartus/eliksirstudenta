class RegistrationController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    @checked = false
  end

  def create
    @team = Team.new
    @checked = false

    if params[:accepted] == "1"
      @checked = true
      @team = Team.new(:name => params[:team][:name])
      if @team.valid?
        if @team.save
          create_and_send_mail_players(@team, params)
        else
          flash.now[:notice] = "Nie podałeś nazwy zespołu!"
          render :action => :new
        end
      else
        flash.now[:notice] = "Taki zespół już istnieje, zmień nazwę." 
        render :action => :new
      end
    else
      flash.now[:notice] = "Nie zaakceptowałeś regulaminu!"
      render :action => :new
    end
  end

  def update
    @team = Team.find_by_name(params[:team][:name])
    @checked = false

    if params[:accepted] == "1"
      @checked = true
      if @team.nil?
        @team = Team.new(params[:team][:name])
        if @team.valid?
          if @team.save
            create_and_send_mail_players(@team, params)
          else
            flash.now[:notice] = "Nie podałeś nazwy zespołu!"
            render :action => :new
          end
        else
          flash.now[:notice] = "Taki zespół już istnieje, zmień nazwę." 
          render :action => :new
        end
      else
        create_and_send_mail_players(@team, params)
      end 
    else
      flash.now[:notice] = "Nie zaakceptowałeś regulaminu!"
      render :action => :new
    end
  end

  def thanks
    @team = Team.find(params[:id])
  end

  def validate
    player = Player.find(params[:id])
    hash = params[:hash]
    if Digest::SHA1.hexdigest(player.salt) == hash
      player.update_attributes(:verified => true)
      redirect_to validation_thanks_registration_url
    else
      redirect_to validation_fail_registration_url
    end
  end

  def validation_thanks
    
  end

  def validation_fail
    
  end

private

  def not_empty_params?(params)
    !params[:first_name].empty? && !params[:surename].empty? && !params[:email].empty?
  end

  def create_and_send_mail_players(team, params)
    first_player = Player.new(:team_id => team.id,
                              :first_name => params[:team][:first_player][:first_name],
                              :surename => params[:team][:first_player][:surename],
                              :email => params[:team][:first_player][:email]) if not_empty_params?(params[:team][:first_player])

    second_player = Player.new(:team_id => team.id,
                               :first_name => params[:team][:second_player][:first_name],
                               :surename => params[:team][:second_player][:surename],
                               :email => params[:team][:second_player][:email]) if not_empty_params?(params[:team][:second_player])

    third_player = Player.new(:team_id => team.id,
                              :first_name => params[:team][:third_player][:first_name],
                              :surename => params[:team][:third_player][:surename],
                              :email => params[:team][:third_player][:email]) if not_empty_params?(params[:team][:third_player])

    if first_player && first_player.valid? && (second_player.nil? || second_player.valid?) && (third_player.nil? || third_player.valid?)
      first_player.save
      Kontakt.deliver_send_confirmation_email(first_player)

      if second_player
        second_player.save
        Kontakt.deliver_send_confirmation_email(second_player)
      end

      if third_player
        third_player.save
        Kontakt.deliver_send_confirmation_email(third_player)
      end

      redirect_to :action => :thanks, :id => team.id
    else
      flash.now[:notice] = "Niepoprawne dane zawodników!"
      render :action => :new
    end
  end
end
