public class AccountUtility implements UtilityInterface{
    private static AccountUtility instance = null;
    public Account acc {get; private set;}
    public String utilId {
        get{
            return this.acc.Id;
        }
    }
    public string phone {
        get{
            if (String.isNotBlank(this.acc.Phone)) {
                return this.acc.Phone;
            } else {
                return '-';
            }
        }
    }
    private AccountUtility(){
        
    }
    private AccountUtility(Account acc){
        this.acc = acc;
    }
    public static AccountUtility newInstance(Account acc){
        return new AccountUtility(acc);
    }
    public static AccountUtility getInstance(){
        if(instance == null){
            instance = new AccountUtility(null);
        }
        return instance;
    }
    public ModelInterface getModel(System.Type modelType){
        ModelInterface t = (ModelInterface) modelType.newInstance();
        t.init(this.acc);
        return t;
    }
}