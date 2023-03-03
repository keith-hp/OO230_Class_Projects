namespace: Expressions
flow:
  name: sha1_flow
  workflow:
    - sha1:
        do:
          Expressions.sha1: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      sha1:
        x: 440
        'y': 280
        navigate:
          54a6dda7-5021-b700-cca4-92f4758be458:
            targetId: 55e36380-e551-c590-fc3a-1723cb41314d
            port: SUCCESS
    results:
      SUCCESS:
        55e36380-e551-c590-fc3a-1723cb41314d:
          x: 880
          'y': 320
