namespace: AOS.product
flow:
  name: iterate_categories
  inputs:
    - json
    - category_id
    - file_path
  workflow:
    - get_category:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json}'
            - json_path: '${"$[?(@.categoryId == "+category_id+")]"}'
        publish:
          - category_json: '${return_result}'
        navigate:
          - SUCCESS: get_category_name
          - FAILURE: on_failure
    - get_category_name:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${category_json}'
            - json_path: '$.*.categoryName'
        publish:
          - category_name: '${return_result[2:-2]}'
        navigate:
          - SUCCESS: get_product_ids
          - FAILURE: on_failure
    - get_product_ids:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${category_json}'
            - json_path: '$.*.products.*.productId'
        publish:
          - product_ids: '${return_result[1:-1]}'
        navigate:
          - SUCCESS: iterate_products
          - FAILURE: on_failure
    - iterate_products:
        loop:
          for: product_id in product_ids
          do:
            AOS.product.iterate_products:
              - json: '${category_json}'
              - category_name: '${category_name}'
              - category_id: '${category_id}'
              - product_id: '${product_id}'
              - file_path: '${file_path}'
          break: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: FAILURE_1
  results:
    - FAILURE
    - SUCCESS
    - FAILURE_1
extensions:
  graph:
    steps:
      get_category:
        x: 120
        'y': 120
      get_category_name:
        x: 320
        'y': 120
      get_product_ids:
        x: 520
        'y': 120
      iterate_products:
        x: 640
        'y': 120
        navigate:
          510d507f-5a94-377d-a8a4-577e8e224ffb:
            targetId: 47300bcc-0cc1-45a0-f9ee-c8129d90af79
            port: SUCCESS
          86be4611-7b4f-5a0e-3c59-43ad4cb8b44c:
            targetId: 8ec1cd14-c896-5ac9-bfc7-791ed7badcc7
            port: FAILURE
    results:
      SUCCESS:
        47300bcc-0cc1-45a0-f9ee-c8129d90af79:
          x: 680
          'y': 320
      FAILURE_1:
        8ec1cd14-c896-5ac9-bfc7-791ed7badcc7:
          x: 800
          'y': 120
