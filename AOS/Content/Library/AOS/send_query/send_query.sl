namespace: AOS.send_query
flow:
  name: send_query
  inputs:
    - Category
    - Product
    - Email
    - Subject
  workflow:
    - send_query_act:
        do:
          AOS.send_query.send_query_act:
            - category: '${Category}'
            - product: '${Product}'
            - email: '${Email}'
            - subject: '${Subject}'
        publish:
          - send_status
        navigate:
          - SUCCESS: string_equals
          - WARNING: string_equals
          - FAILURE: on_failure
    - string_equals:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${send_status}'
            - second_string: Thank you for contacting Advantage support.
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      send_query_act:
        x: 80
        'y': 80
      string_equals:
        x: 280
        'y': 80
        navigate:
          6efc7914-ea98-f463-5444-805e535dbb70:
            targetId: a81337cb-3c4b-ab9e-67f2-e89f4ceb30fc
            port: SUCCESS
    results:
      SUCCESS:
        a81337cb-3c4b-ab9e-67f2-e89f4ceb30fc:
          x: 480
          'y': 80
