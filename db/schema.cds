namespace RiskManagement;

using {managed} from '@sap/cds/common';

entity Risk : managed
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    mitigation : Association to one Mitigation;
}

entity Mitigation : managed
{
    key ID : UUID;
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risk : Association to many Risk on risk.mitigation = $self;
}
