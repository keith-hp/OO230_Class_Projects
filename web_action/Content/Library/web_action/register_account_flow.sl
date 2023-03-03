namespace: web_action
flow:
  name: register_account_flow
  inputs:
    - url: 'http://aos:8082'
    - username: helenk4
    - password: Helenk01
    - first_name: Helen
    - last_name: Keller
    - email: hk2@merant.com
  workflow:
    - register_account:
        do:
          web_action.register_account:
            - url: '${url}'
            - username: '${username}'
            - password: '${password}'
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - email: '${email}'
        publish:
          - error_message_account: '${error_message}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - return_result
    - error_message
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      register_account:
        x: 160
        'y': 320
        navigate:
          a96d0298-b952-12f0-b45d-324c498c5b3c:
            targetId: 8dc3fab0-eb44-8a9a-6a0a-82b8fdc3855a
            port: SUCCESS
          0212b6de-9f1d-a3f4-d596-749b72d1995c:
            targetId: 8dc3fab0-eb44-8a9a-6a0a-82b8fdc3855a
            port: WARNING
    results:
      SUCCESS:
        8dc3fab0-eb44-8a9a-6a0a-82b8fdc3855a:
          x: 400
          'y': 150
