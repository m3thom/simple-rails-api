node(:type) { locals[:instance].model_name.name }

node(:pagy, if: @pagy.present?) { pagy_metadata(@pagy) }
