namespace: XML
flow:
  name: ValidateXML
  workflow:
    - validate:
        do:
          io.cloudslang.base.xml.validate:
            - xml_document: "C:\\OOLabs\\XMLSample.xml"
            - xml_document_source: xmlPath
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      validate:
        x: 360
        'y': 200
        navigate:
          d02b317f-b8c7-714e-676e-620e5b703cd6:
            targetId: 20bcd25a-1de3-035a-69fe-46a5e2ac2f7d
            port: SUCCESS
    results:
      SUCCESS:
        20bcd25a-1de3-035a-69fe-46a5e2ac2f7d:
          x: 600
          'y': 240
