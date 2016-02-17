class ApiDescriptionController < ApplicationController

    def index
      apis_param = params[:apis]
      apis = apis_param.nil? ? [] : apis_param.split(',')

      apis_js = apis.map do |api|
        <<-API
         window.api_names.push('#{api}');
         window.apis.push(function(mapi, store) {
                            var restApiStoreAdapter = new mapi.RestApiStoreAdapter('http://localhost:3001/api', '#{api.singularize}')
                            mapi.RegisterNoun('#{api}', store,  restApiStoreAdapter);
                        });
        API
      end.join(' ')

      js = <<-SOMETHING
        (function() {
            if(window.apis === undefined) {
                window.apis = [];
                window.api_names = [];
            }

          #{apis_js}
        })();
      SOMETHING

      respond_to do |format|
          format.js { render text: js }
      end
    end

end