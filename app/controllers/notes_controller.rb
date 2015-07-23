class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :update, :destroy]

	def index
		@notes = current_user.notes.order("created_at DESC")
	end

	def show

	end

	def new
		@note = current_user.notes.build
	end

	def create
		@note = current_user.notes.build(note_params)
		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

	def edit

	end

	def update
		if @note.update(note_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	private

		def find_note
			@note = Note.find(params[:id])
		end

		def note_params
			params.require(:note).permit(:content, :title)
		end
end
