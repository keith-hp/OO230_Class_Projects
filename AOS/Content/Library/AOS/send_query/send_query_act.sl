namespace: AOS.send_query
operation:
  name: send_query_act
  inputs:
    - category: Laptops
    - product: HP Pavilion 15z Laptop
    - email: fred@advantage.inc
    - subject: Is this bluetooth?
  sequential_action:
    gav: 'com.microfocus.seq:AOS.send_query.send_query_act:1.0.0'
    skills:
      - Web
    settings:
      windows:
        active: false
      web:
        active: true
        address: 'http://aos:8082'
        browser: FIREFOX64
        close_on_exit: true
    steps:
      - step:
          id: '1'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").Link("CONTACT US")'
          action: Click
          snapshot: ".\\Snapshots\\ssf1.html"
          highlight_id: '10000000'
      - step:
          id: '2'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebList("categoryListboxContactUs")'
          action: Select
          default_args: '"Laptops"'
          snapshot: ".\\Snapshots\\ssf2.html"
          highlight_id: '10000000'
          args: 'Parameter("category")'
      - step:
          id: '3'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebList("productListboxContactUs")'
          action: Select
          default_args: '"HP Pavilion 15z Laptop"'
          snapshot: ".\\Snapshots\\ssf3.html"
          highlight_id: '10000000'
          args: 'Parameter("product")'
      - step:
          id: '4'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("emailContactUs")'
          action: Set
          default_args: '"keith@hp.com"'
          snapshot: ".\\Snapshots\\ssf4.html"
          highlight_id: '10000000'
          args: 'Parameter("email")'
      - step:
          id: '5'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebEdit("subjectTextareaContactUs")'
          action: Set
          default_args: '"Is this a good laptop for gaming?"'
          snapshot: ".\\Snapshots\\ssf5.html"
          highlight_id: '10000000'
          args: 'Parameter("subject")'
      - step:
          id: '6'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebButton("send_btnundefined")'
          action: Click
          snapshot: ".\\Snapshots\\ssf6.html"
          highlight_id: '10000000'
      - step:
          id: '7'
          object_path: 'Browser("Advantage Shopping").Page("Advantage Shopping").WebElement("Thank you for contacting")'
          action: Output
          default_args: 'CheckPoint("send_status")'
  outputs:
    - send_status:
        robot: true
        value: '${send_status}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification:
          base_filter:
            property_ref:
              - micclass
          optional_filter:
            property_ref:
              - name
              - title
              - openurl
              - opentitle
              - openedbytestingtool
              - number of tabs
          algorithm: Mercury.TolerantPriority
          active: true
        name: Advantage Shopping
        child_objects:
          - object:
              smart_identification:
                base_filter:
                  property_ref:
                    - micclass
                optional_filter:
                  property_ref:
                    - title
                    - url
                algorithm: Mercury.TolerantPriority
                active: true
              name: Advantage Shopping
              child_objects:
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - class
                          - default value
                          - items count
                          - visible items
                          - visible
                          - acc_name
                          - first item
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: productListboxContactUs
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebList
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW[2]/DIV[1]/SELECT[@role="listbox"][1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '402'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1'
                            regular_expression: false
                          name: visible items
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: '413'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '408'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: productListboxContactUs
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '12'
                            regular_expression: false
                          name: items count
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: SELECT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: first item
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '#0'
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-pristine ng-untouched ng-valid ng-scope in-focus
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '510'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '408'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: '03 March 2023 14:27:58'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - class
                          - default value
                          - items count
                          - visible items
                          - visible
                          - acc_name
                          - first item
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: categoryListboxContactUs
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebList
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW[1]/DIV[1]/SELECT[@role="listbox"][1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '402'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1'
                            regular_expression: false
                          name: visible items
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: '357'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '408'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: categoryListboxContactUs
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '6'
                            regular_expression: false
                          name: items count
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: SELECT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '26'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: first item
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '#0'
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-pristine ng-untouched ng-valid ng-scope in-focus
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '454'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '408'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebList
                    visual_relations: ''
                    last_update_time: '03 March 2023 14:27:58'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: Thank you for contacting
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Thank you for contacting Advantage support.
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: P
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: roboto-regular successMessage ng-binding
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="registerSuccessCover"]/DIV[1]/P[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WebElement
                    visual_relations: ''
                    last_update_time: '03 March 2023 14:27:58'
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: subjectTextareaContactUs
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[@id="supportCover"]/DIV/SEC-FORM/DIV/DIV[normalize-space()="* Subject SEND"]/SEC-VIEW[1]/DIV[1]/TEXTAREA[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '334'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '383'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '914'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: textarea
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '2'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: subjectTextareaContactUs
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: TEXTAREA
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '115'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '480'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '914'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: '03 March 2023 14:27:58'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - type
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - html id
                          - max length
                          - default value
                          - class
                          - rows
                          - placeholder
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: emailContactUs
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//SEC-VIEW/DIV[normalize-space()="*Email"]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '402'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '469'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '408'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '0'
                            regular_expression: false
                          name: rows
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: emailContactUs
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '524288'
                            regular_expression: false
                          name: max length
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '27'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: default value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ng-untouched ng-valid ng-scope in-focus ng-dirty ng-valid-parse
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '566'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '408'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebEdit
                    visual_relations: ''
                    last_update_time: '03 March 2023 14:27:58'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: send_btnundefined
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: WebButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//BUTTON[@id="send_btnundefined"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '210'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: '538'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1070'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: SEND
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: button
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SEND
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: BUTTON
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: send_btnundefined
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '44'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: sec-sender-a ng-scope
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '635'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1070'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: WebButton
                    visual_relations: ''
                    last_update_time: '03 March 2023 14:27:58'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                - object:
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - text
                          - html id
                          - class
                          - name
                          - href
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    name: CONTACT US
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Link
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//LI/A[@role="link" and normalize-space()="CONTACT US"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '129'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: '7'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1034'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: CONTACT US
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: CONTACT US
                            regular_expression: false
                          name: name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: A
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'javascript:void(0)'
                            regular_expression: false
                          name: href
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '52'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: menu navLinks roboto-regular ng-scope
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '104'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '1034'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    comments: ''
                    custom_replay: ''
                    class: Link
                    visual_relations: ''
                    last_update_time: '03 March 2023 14:27:58'
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - text
                        - html tag
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: user-input in post data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: user input in get data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'http://aos:8082/#'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'http://aos:8082/#'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: "\_Advantage Shopping"
                      regular_expression: false
                    name: title
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: non user-input in post data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: non user-input in get data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Page
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '10015'
                      regular_expression: false
                    name: index
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: document size
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: all data in get method
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: Page
              visual_relations: ''
              last_update_time: '03 March 2023 14:27:58'
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: "\_Advantage Shopping"
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'http://aos:8082'
                regular_expression: false
              name: openurl
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: "\_Advantage Shopping"
                regular_expression: false
              name: opentitle
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: openedbytestingtool
              hidden: true
              read_only: true
              type: BOOL
          - property:
              value:
                value: '1'
                regular_expression: false
              name: number of tabs
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: "\_Advantage Shopping"
                regular_expression: false
              name: name
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Browser
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '1'
                regular_expression: false
              name: browserindex
              hidden: true
              read_only: true
              type: I2
        comments: ''
        custom_replay: ''
        class: Browser
        visual_relations: ''
        last_update_time: '03 March 2023 14:27:58'
        basic_identification:
          property_ref:
            - micclass
          ordinal_identifier:
            value: 2
            type: creationtime
  check_points_and_outputs:
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value: ''
              visual_relations: ''
              parameter:
                value: '"send_status"'
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: innertext
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: send_status
        type: Output
        class: VerifyObj
  parameters: []
