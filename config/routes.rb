TicketsService::Application.routes.draw do
  match 'orders/:order_id/ticket' => 'tickets#show'
  root :to => 'tickets#index'
end
