namespace: AOS
flow:
  name: send_query
  inputs:
    - category_f
    - product_f
    - email_f
    - subject_f
  workflow:
    - send_query_act:
        do:
          AOS.send_query_act2:
            - category: '${category_f}'
            - product: '${product_f}'
            - email: '${email_f}'
            - subject: '${subject_f}'
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
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      string_equals:
        x: 400
        'y': 120
        navigate:
          c805ab17-4429-5519-a5a4-b8de30fabb31:
            targetId: cd560aa7-2766-d0a1-24db-32690525eb01
            port: SUCCESS
      send_query_act:
        x: 160
        'y': 120
    results:
      SUCCESS:
        cd560aa7-2766-d0a1-24db-32690525eb01:
          x: 600
          'y': 120
