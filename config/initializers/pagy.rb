require 'pagy/extras/metadata'

Pagy::DEFAULT[:metadata] = [:page,
                            :count,
                            :pages,
                            :last,
                            :prev,
                            :next,
                            :series,]
