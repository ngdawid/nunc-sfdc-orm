public class OwnerModel extends ObjectModel{
    public String JobPartyCust_vName1 {get;set;}
    public String JobPartyCust_vStreet1 {get;set;}
    public String JobPartyCust_vTown {get;set;}
    public String JobPartyCust_vPostcode {get;set;}
    public String JobPartyCust_vNation {get;set;}
    public String JobPartyCust_vPhone {get;set;}
    public String JobPartyCust_vMail {get;set;}
    
    public override void setMapper(){
        modelMapper = OwnerModel.OwnerModelMapper.class;  
    }
    public OwnerModel init(Account acc){
        return (OwnerModel) super.init((sObject) acc);
    }

    
    public class OwnerModelMapper extends ModelMapper{     
        public override void run(sObject sObj){
            Account source = (Account) sObj;
            OwnerModel model = (OwnerModel) super.model;
            
            AccountUtility util = AccountUtility.newInstance(source);
			
            model.JobPartyCust_vName1 = (String) source.get('Name');
            model.JobPartyCust_vStreet1 = source.BillingStreet;
            model.JobPartyCust_vTown = source.BillingState;
            model.JobPartyCust_vPostcode = source.BillingPostalCode;
            model.JobPartyCust_vNation = source.BillingCountry;
            model.JobPartyCust_vPhone = util.phone;
        }
        public override String getQueryString(){
            return 'Id, Name, BillingStreet, BillingState, BillingPostalCode, BillingCountry, Phone ';
        }
    }
}