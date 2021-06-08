require 'swagger_helper'

describe 'Statistics and lists', type: :request do

  path '/stats/modules' do
    get 'Returns list of modules' do
      tags 'Modules'
      consumes 'application/json'

      #parameter({
      #              :in => :header,
      #              :type => :string,
      #              :name => :Authorization,
      #              :required => true,
      #              :description => 'Client token'
      #          })

      response '200', 'OK' do
        schema type: :object,
               properties: {
                   list: {
                       category_name: {
                           type: :array,
                           items: {
                               properties: {
                                   id: {type: :number},
                                   name: { type: :string},
                                   description: {type: :string},
                                   category: { type: :string}
                               }

                           }
                       }

                   }
               }

        run_test!
      end

      response '404', 'Not found' do
        schema type: :object,
               properties: {}
        run_test!
      end

    end
  end

  path '/stats/top_modules' do
    get 'Returns list of top modules' do
      tags 'Modules'
      consumes 'application/json'

      #parameter({
      #              :in => :header,
      #              :type => :string,
      #              :name => :Authorization,
      #              :required => true,
      #              :description => 'Client token'
      #          })

      response '200', 'OK' do
        schema type: :object,
               properties: {
                   top_list: {
                       type: :array,
                       items: {
                           properties: {
                               game_course_module_id: {type: :number},
                               count: { type: :number },
                               name: { type: :string }
                           }

                       }

                   }
               }

        run_test!
      end

      response '404', 'Not found' do
        schema type: :object,
               properties: {}
        run_test!
      end

    end
  end

  path '/stats/top_learners' do
    get 'Returns list of top learners by month and week' do
      tags 'Learners'
      consumes 'application/json'

      #parameter({
      #              :in => :header,
      #              :type => :string,
      #              :name => :Authorization,
      #              :required => true,
      #              :description => 'Client token'
      #          })

      response '200', 'OK' do
        schema type: :object,
               properties: {
                   list_by_month: {
                       type: :array,
                       items: {
                           properties: {
                               user_account_id: {type: :number},
                               count: { type: :number },
                               username: { type: :string }
                           }

                       }
                   },
                   list_by_week: {
                       type: :array,
                       items: {
                           properties: {
                               user_account_id: {type: :number},
                               count: { type: :number },
                               username: { type: :string }
                           }

                       }
                   }
               }

        run_test!
      end

      response '404', 'Not found' do
        schema type: :object,
               properties: {}
        run_test!
      end

    end
  end

end
