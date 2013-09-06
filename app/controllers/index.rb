get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :event_create
end

post '/events/new' do
  @event = Event.new(params[:event])
  if @event.save
    redirect "/events/#{@event.id}/show"
  else
    @errors = @event.errors
  erb :event_create
  end
end
