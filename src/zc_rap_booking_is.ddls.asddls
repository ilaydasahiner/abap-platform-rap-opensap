@EndUserText.label: 'Booking BO Projection View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true //to allow the projection view to be enhanced with separate metadata extensions
@Search.searchable: true //to enable the full-text search
define view entity ZC_RAP_BOOKING_IS
  as projection on ZI_RAP_BOOKING_IS as Booking
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true //to enable the freestyle search for the view column
      BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }] //to define value helps for the view element CustomerID
      @ObjectModel.text.element: ['CustomerName'] //to specify CustomerName as textual descriptions for the element CustomerID
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName, //the projection list has been enhanced with the element CustomerName from the Association _Customer
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
      @ObjectModel.text.element: ['CarrierName']
      CarrierID,
      _Carrier.Name      as CarrierName,
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                                           additionalBinding: [ { localElement: 'CarrierID',    element: 'AirlineID' },
                                                                { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                                                { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT },
                                                                { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode' //to define currencyCode as the reference field for the currency field FlightPrice
      FlightPrice,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      LocalLastChangedAt,

      /* associations */
      _Travel : redirected to parent ZC_RAP_TRAVEL_IS,
      _Customer,
      _Carrier,
      _Connection,
      _Flight
}
