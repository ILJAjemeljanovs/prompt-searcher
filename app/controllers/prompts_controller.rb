class PromptsController < ApplicationController

  def index

  end

  def random_prompt
    render turbo_stream: turbo_stream.update('prompt', Prompt.all.sample)
  end

  def search_prompt
    search_query = {
      query: {
        match: {
          text: params[:query]
        }
      },
      size: 20
    }
    prompts = Prompt.search(search_query)

    render turbo_stream: turbo_stream.update('prompt', partial: 'prompt_list', locals: { prompts: prompts })
  end
end
