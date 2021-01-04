Scenario: Locate Parts and provide Pricing Availability and Dealer Information based on search on OEM web or mobile application
    Description: Locate a Part on Dealer's inventory and provide Price Availability and Dealer Information based on a search conducted by a Person
    Given a Person has selected a Part on a Web or Mobile application provided by the OEM
    When the Person submits a Search
    And the request operation is get
    And request path is /locate-part
    And request header parameters include header.accept-language,header.accept-encoding,header.accept,header.accept-charset
    And request query parameters include query.partLocator
    And request body will be empty
    Then response options include 200:part-found,400:bad-request,401:unauthorized,403:forbidden,404:not-found as application/json
    And the Person receives the Part's Price, Availability, and Location of the Dealers that have the part in stock 



Scenario: A Person Reserves Parts
    Description: Reserve Parts based on availability
    Given a Person has received a list of Parts including location and prices quantity 
    When the Person selects and submits the parts to be reserved by the Dealer
    And the request operation is post
    And request path is /reserve-parts
    And request header parameters include accept,accept-charset,accept-encoding,accept-language
    And request body include required parts-lit as application/json
    Then response options include 201:parts-list,400:bad-request,401:unauthorized,403:forbidden,404:not-found,503:service-unavailable as application/json
    And the Person receives a parts reservation confirmation number


Scenario: Locate Parts and provide Pricing Availability and Location based on Dealer to Dealer Sales 
    Description: Locate a Part on Dealer's inventory and provide Price Availability and Dealer Information based on a search conducted by a Dealer
    Given a Dealer has selected a Part on a Web,  Mobile, or DMS application
    When the Dealer submits a Search
    And the request operation is get
    And request path is /locate-part
    And request header parameters include header.accept-language,header.accept-encoding,header.accept,header.accept-charset
    And request query parameters include query.partLocator
    And request body will be empty
    Then response options include 200:part-found,400:bad-request,401:unauthorized,403:forbidden,404:not-found as application/json
    And the Dealer receives the Part's Price, Availability, and Location of the Dealers that have the part in stock 

Scenario: A Dealer Reserves Parts from other Dealers
    Description: Reserve Parts based on availability
    Given a Dealer has received a list of Parts including location and prices 
    When the Dealer selects and submits the parts to be reserved by another Dealer
    And the request operation is post
    And request path is /reserve-parts
    And request header parameters include accept,accept-charset,accept-encoding,accept-language
    And request body include required parts-lit as application/json
    Then response options include 201:parts-list,400:bad-request,401:unauthorized,403:forbidden,404:not-found,503:service-unavailable as application/json
    And the Dealer receives a parts reservation confirmation number


Scenario: Locate Parts and provide Pricing Availability and Location based on Dealer inquiring on OEM stock
    Description: Locate a Part on OEM's inventory and provide Price Availability and Location Information based on a search conducted by a Dealer
    Given a Dealer has selected a Part on a Web,  Mobile, or DMS application
    When the Dealer submits a Search
    And the request operation is get
    And request path is /locate-part
    And request header parameters include header.accept-language,header.accept-encoding,header.accept,header.accept-charset
    And request query parameters include query.partLocator
    And request body will be empty
    Then response options include 200:part-found,400:bad-request,401:unauthorized,403:forbidden,404:not-found as application/json
    And the Dealer receives the Part's Price, Availability, and Location of the Dealers that have the part in stock 

Scenario: A Dealer Orders Parts from OEM
    Description: Order Parts based on availability
    Given a Dealer has received a list of Parts including location and prices 
    When the Dealer selects and submits the parts to be ordered from OEM
    And the request operation is post
    And request path is /reserve-parts
    And request header parameters include accept,accept-charset,accept-encoding,accept-language
    And request body include required parts-lit as application/json
    Then response options include 201:parts-list,400:bad-request,401:unauthorized,403:forbidden,404:not-found,503:service-unavailable as application/json
    And the Dealer receives a parts order confirmation number


Scenario: Cancel Order
    Description: A Person cancels a parts order
    Given a Person desires to cancels a parts order
    When the Person submits a cancelation request 
    And the Person provides de parts order number
    And the request operation is post
    And request path is /cancel-parts-order
    And request header parameters include accept,accept-charset,accept-encoding,accept-language
    And request body include required parts-order-number as application/json
    Then response options include 201:parts-list,400:bad-request,401:unauthorized,403:forbidden,404:not-found,503:service-unavailable as application/json
    And the Person receives a parts order cancelation confirmation number



Scenario: Change Order (need input from group)

