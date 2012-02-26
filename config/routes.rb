#encoding: utf-8
Tianji::Application.routes.draw do
  # get '/'
  namespace "ueditor" do
    resources :images, :only=>[:new, :create]
  end
end