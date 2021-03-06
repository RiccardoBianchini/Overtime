class PlaybooksController < ApplicationController
    before_action :authenticate_user!

    def new
        @playbook = Playbook.new
    end

    def edit
        @playbook = Playbook.find(params[:id])
    end

    def index
        @playbooks = Playbook.all
    end

    def show
        @playbook = Playbook.find params[:id]
    end

    def create
        if current_user.admin?
            @playbook = Playbook.new playbooks_params
            try_and_get_image
            if @playbook.save
                redirect_to @playbook
            else
                render 'new'
            end
        else
            redirect_to root_path
        end
    end

    def update
        if current_user.admin?
            @playbook = Playbook.find(params[:id])
            @playbook.update(playbooks_params)
            try_and_get_image
            @playbook.save
          
            redirect_to @playbook
        else
          redirect_to root_path
        end
    end

    def destroy
        if current_user.admin?
            @playbook = Playbook.find(params[:id])
            @playbook.destroy
 
            redirect_to playbooks_path
        else
            redirect_to root_path
        end
    end

    def star
        @playbook = Playbook.find(params[:id])

        playbook_star = PlaybookStar.find_by(:playbook => @playbook, :user => current_user)
        if !playbook_star.nil?
            playbook_star.destroy
            redirect_to discussion_path(@playbook)
            return
        end

        playbook_star = PlaybookStar.new(:playbook => @playbook, :user => current_user)
        playbook_star.save
        redirect_to playbook_path(@playbook)
    end
    private 
        def playbooks_params
            params.require(:playbook).permit(:title, :body)
        end

        def try_and_get_image
            if !params[:playbook][:image].nil?
                b64 = Base64.encode64(params[:playbook][:image].read)
                @playbook.image = b64
            end
        end
end
