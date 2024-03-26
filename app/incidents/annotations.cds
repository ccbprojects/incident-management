using ProcessorService as service from '../../srv/processor-service';
using from '../../db/schema';

annotate service.Incidents with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'customer_ID',
            Value : customer_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : status.descr,
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : urgency.descr,
        },
    ]
);
annotate service.Incidents with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};
annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'customer_ID',
                Value : customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'urgency_code',
                Value : urgency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status_code',
                Value : status_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.Incidents with @(
    UI.SelectionFields : [
        status_code,
        urgency_code,
    ]
);
annotate service.Incidents with {
    status @Common.Label : 'Status'
};
annotate service.Incidents with {
    urgency @Common.Label : '{i18n>Urgency}'
};
annotate service.Incidents with {
    status @Common.ValueListWithFixedValues : true
};
annotate service.Status with {
    code @Common.Text : descr
};
annotate service.Incidents with {
    urgency @Common.ValueListWithFixedValues : true
};
annotate service.Urgency with {
    code @Common.Text : descr
};
