namespace: Expressions
flow:
  name: slice
  workflow:
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: |-
                ${'''
                {
                "names" : [ "Adam", "Thom", "David", "Mary" ]
                }
                '''}
            - json_path: $.names
        publish:
          - names: '${str(eval(return_result)[::-1])}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      json_path_query:
        x: 520
        'y': 320
        navigate:
          b7e57669-c474-6cc7-f14f-dfc0400ff0d8:
            targetId: e6d569bd-ecb1-6dc7-59e6-262a1bdf1f27
            port: SUCCESS
    results:
      SUCCESS:
        e6d569bd-ecb1-6dc7-59e6-262a1bdf1f27:
          x: 720
          'y': 320
