using { RiskManagement as my } from '../db/schema';

@path : '/service/RiskManagement'
service RiskManagementService
{
    annotate Mitigation with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate Risk with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    entity Risk as
        projection on my.Risk;

    entity Mitigation as
        projection on my.Mitigation;
}

annotate RiskManagementService with @requires :
[
    'authenticated-user',
    'RiskViewer',
    'RiskManager'
];
