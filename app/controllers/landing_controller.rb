class LandingController < ApplicationController
  before_action :redirect_if_signed_in
end
