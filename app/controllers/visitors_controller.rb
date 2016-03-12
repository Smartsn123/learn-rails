class VisitorsController <ApplicationController

        def new
                @owner=Owner.new
                #rendering is done automatically by the controller to page views/visitors new.html.erb
                #flash.now[:notice] = 'welcome!'
                #flash.now[:alert] = 'My birthday is soon !'
       end
end
