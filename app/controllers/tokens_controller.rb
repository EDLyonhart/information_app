class TokensController < ApplicationController

  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)

    respond_to do |format|
      if @token.save
        format.html { redirect_to user_path, notice: 'token was successfully created.' }
        format.json { render :show, status: :created, location: @token }
      else
        format.html { render :new }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @token.update(token_params)
        format.html { redirect_to @token, notice: 'Token was successfully updated.' }
        format.json { render :show, status: :ok, location: @token }
      else
        format.html { render :edit }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @token.destroy
    respond_to do |format|
      format.html { redirect_to tokens_url, notice: 'Token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_token(@user)
    if @token.user_id
      @token.generate(@user.id)
      redirect_to user_path
    else
      redirect_to new_token_path
    end
  end

end
