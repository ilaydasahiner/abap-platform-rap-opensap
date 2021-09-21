@EndUserText.label: 'Travel BO Projection View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true //to allow the projection view to be enhanced with separate metadata extensions
@Search.searchable: true //to enable the full-text search
define root view entity ZC_RAP_TRAVEL_IS
  as projection on ZI_RAP_TRAVEL_IS as Travel
{

      //NOT: Custom entities must not be part of a projection view! Therefore;
      //1.comment out the field AgencyName since it uses the association _Agency which is not allowed
      //2.comment out the annotation @ObjectModel.text.element: ['AgencyName'] which uses the field AgencyName
      //3.replace the annotation for the value help AgencyID so that the value help uses the newly created custom entity instead of the CDS view /DMO/I_Agency

  key TravelUUID,
      @Search.defaultSearchElement: true //to enable the freestyle search for the view column
      TravelID,
      //@Consumption.valueHelpDefinition: [{ entity : {name : '/DMO/I_Agency', element : 'AgencyID' } }] //to define value helps for the view element AgencyID
      @Consumption.valueHelpDefinition: [{ entity : {name : 'ZCE_RAP_AGENCY_IS', element : 'AgencyId' } }] //to define value helps for the view element AgencyID
      //@ObjectModel.text.element: ['AgencyName'] //to specify AgencyName as textual descriptions for the element AgencyID
      @Search.defaultSearchElement: true
      AgencyID,
      //_Agency.Name       as AgencyName, //the projection list has been enhanced with the element AgencyName from the Association _Agency
      @Consumption.valueHelpDefinition: [{ entity : {name : '/DMO/I_Customer', element : 'CustomerID' } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode' //to define currencyCode as the reference field for the currency field BookingFee
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity : {name : 'I_Currency', element : 'Currency' } }]
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_RAP_BOOKING_IS,
      _Currency,
      _Customer
}
