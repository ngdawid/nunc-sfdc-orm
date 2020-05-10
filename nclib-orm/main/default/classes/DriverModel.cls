public class DriverModel extends ObjectModel{
    public String Job_vDriverName {get;set;}
    public String Job_vDriverStreet {get;set;}
    public String Job_vDriverTown {get;set;}
    public String Job_vDriverPostCode {get;set;}
    public String Job_vDriverPhone {get;set;}
    public String Job_vDriverMail {get;set;}
    public String Job_vDriverLanguage {get;set;}
    
    public override void setMapper(){
        modelMapper = DriverModel.DriverModelMapper.class;  
    }
    public DriverModel init(Account acc){
        return (DriverModel) super.init((sObject) acc);
    }
    
    
    public class DriverModelMapper extends ModelMapper{     
        public override void run(sObject sObj){
            Account source = (Account) sObj;
            DriverModel model = (DriverModel) super.model;
            
            AccountUtility util = AccountUtility.newInstance(source);
            
            model.Job_vDriverName = source.Name;
            model.Job_vDriverStreet = source.BillingStreet;
            model.Job_vDriverTown = source.BillingCity;
            model.Job_vDriverPostCode = source.BillingPostalCode;
            model.Job_vDriverPhone = util.phone;
            model.Job_vDriverLanguage = source.Description;
        }
        public override String getQueryString(){
            return 'Id, Name, BillingStreet, BillingState, BillingPostalCode, BillingCountry, Phone';
        }
    }
}