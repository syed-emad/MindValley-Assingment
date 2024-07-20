defmodule ShoppingCartWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :shopping_cart
  # import Plug.CORS
  # plug CORS,
  #   origin: "*",
  #   methods: [:get, :post, :put, :patch, :delete, :options],
  #   headers: ["authorization", "content-type", "x-requested-with"],
  #   max_age: 86400  # Cache CORS preflight requests for 1 d
  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_shopping_cart_key",
    signing_salt: "2ipd6ufY",
    same_site: "Lax"
  ]

  # socket "/live", Phoenix.LiveView.Socket,
  #   websocket: [connect_info: [session: @session_options]],
  #   longpoll: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :shopping_cart,
    gzip: false,
    only: ShoppingCartWeb.static_paths()

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :shopping_cart
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug CORSPlug
  plug ShoppingCartWeb.Router
  plug Corsica,
    origins: [
      "http://localhost:4000",
      "http://localhost:5173",
      "http://localhost:3000"
    ],
    allow_headers: ["accept", "content-type", "authorization"],
    allow_credentials: true,
    log: [rejected: :error, invalid: :warn, accepted: :debug]
end
