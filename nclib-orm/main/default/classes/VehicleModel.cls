public class VehicleModel extends ObjectModel{
    public String JobX_vVeh1SerialNum {get;set;}
    public String JobX_vVeh1RegNum1 {get;set;}
    public String JobX_dVeh1Reg {get;set;}
    public String JobX_vVeh1Make {get;set;}
    public String JobX_vVeh1Model {get;set;}
    public String JobX_vVeh1EngineType {get;set;}
    public String JobX_vVeh1GearboxType {get;set;}
    public String Job_iVeh1Odometer {get;set;}
    public String Job_iVeh1Modelyear {get;set;}
    public String Job_vVeh1Color {get;set;}
    public String Job_vVeh1Drive {get;set;}
    public String MSISDN {get;set;}
    
	public override void setMapper(){
        modelMapper = VehicleModel.VehicleModelMapper.class;  
    }
    public VehicleModel init(Account acc){
        return (VehicleModel) super.init((sObject) acc);
    }
    
    
    public class VehicleModelMapper extends ModelMapper{     
        public override void run(sObject sObj){
            Asset source = (Asset) sObj;
            System.Type veh = Asset.class;
            VehicleModel model = (VehicleModel) super.model;
            
            model.JobX_vVeh1SerialNum = '';//source.VIN__c;
			model.JobX_vVeh1RegNum1 = '';//source.LicensePlate__c;
			model.JobX_dVeh1Reg = '';//Datetime.newInstance(source.DateOfDelivery__c, Time.newInstance(0, 0, 0, 0)).format('yyyy-MM-dd');
			model.JobX_vVeh1Make = '';//source.VehicleVariant__r.Brand__r.Name;
			model.JobX_vVeh1Model = '';//source.Model__c;
			model.JobX_vVeh1EngineType = '';//source.Motorization__c;
			model.JobX_vVeh1GearboxType = '';//source.Transmission__c;
			model.Job_iVeh1Odometer = '';//source.CurrentMileage__c;
			model.Job_iVeh1Modelyear = '';//Integer.valueOf(source.ModelYear__c)+',';
			/*if (cs.Asset.Color__c != null) {
				if (cs.Asset.Color__c.length() > 10)
					model.Job_vVeh1Color = source.Color__c.substring(0, 11)+'",';
				else {
					model.Job_vVeh1Color = source.Color__c;
				}
			}*/
			model.Job_vVeh1Drive = '';//source.PowerUnit__c;
			model.MSISDN = '';//source.MSISDN__c;
        }
        public override String getQueryString(){
            return 'Id, Name, BillingStreet, BillingState, BillingPostalCode, BillingCountry, Phone';
        }
    }
}