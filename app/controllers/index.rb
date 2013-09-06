get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
	@new_event = []
  erb :event_create
end

post '/events/create' do
  @event = Event.new(params[:event])
  @event.save
  @errors = @event.errors
 
  erb :event_create
end
