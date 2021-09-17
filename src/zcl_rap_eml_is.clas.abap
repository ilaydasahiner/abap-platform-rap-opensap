CLASS zcl_rap_eml_is DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_is IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


*    " step 1 - READ
*    READ ENTITIES OF ZI_RAP_TRAVEL_IS
*        ENTITY Travel "the entity we want to perform operation
*         FROM   VALUE #( ( TravelUUID = 'E5ED84C04FDAEFA217000802F0E827EA' ) ) "keys for which we want to perform the read operation
*        RESULT DATA(travels). "The result of the read will be put into the inline declared table travels
*
*    out->write( travels ).

*--------------------------------------------------------------------------------------

*    " step 2 - READ with Fields
*    READ ENTITIES OF ZI_RAP_TRAVEL_IS
*      ENTITY travel
*        FIELDS ( AgencyID CustomerID )
*      WITH VALUE #( ( TravelUUID = 'E5ED84C04FDAEFA217000802F0E827EA' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

*--------------------------------------------------------------------------------------

*    " step 3 - READ with All Fields
*    READ ENTITIES OF ZI_RAP_TRAVEL_IS
*      ENTITY travel
*        ALL FIELDS WITH VALUE #( ( TravelUUID = 'E5ED84C04FDAEFA217000802F0E827EA' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

*--------------------------------------------------------------------------------------

*    " step 4 - READ By Association
*    READ ENTITIES OF ZI_RAP_TRAVEL_IS
*      ENTITY travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = 'E5ED84C04FDAEFA217000802F0E827EA' ) )
*      RESULT DATA(bookings).
*
*    out->write( bookings ).

*--------------------------------------------------------------------------------------

*    " step 5 - Unsuccessful READ
*    READ ENTITIES OF ZI_RAP_TRAVEL_IS
*      ENTITY travel
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*      RESULT DATA(travels)
*      FAILED DATA(failed) "is used to convey unsuccessful operations
*      REPORTED DATA(reported). "is used to provide related T100 messages
*
*    out->write( travels ).
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output

*--------------------------------------------------------------------------------------

*    " step 6 - MODIFY Update
*    MODIFY ENTITIES OF ZI_RAP_TRAVEL_IS
*      ENTITY travel
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( TravelUUID  = 'E5ED84C04FDAEFA217000802F0E827EA'
*                 Description = 'I like RAP@openSAP' ) )
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( 'Update done' ).
*
*
*    " step 6b - Commit Entities
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_is
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).

*--------------------------------------------------------------------------------------

*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZI_RAP_TRAVEL_IS
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_TRAVEL_IS
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

*--------------------------------------------------------------------------------------

*    " step 8 - MODIFY Delete
*    MODIFY ENTITIES OF zi_rap_travel_is
*      ENTITY travel
*        DELETE FROM
*          VALUE
*            #( ( TravelUUID  = '02FC450E52601EEC85B024220CBFEA08' ) )
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*      RESPONSE OF zi_rap_travel_is
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Delete done' ).

  ENDMETHOD.

ENDCLASS.
