defmodule ShoppingCartWeb.DefaultController do
 use ShoppingCartWeb,:controller
 def index(conn,_params) do
 text conn, "The Shopping API is live - #{Mix.env()}"
 end
end
