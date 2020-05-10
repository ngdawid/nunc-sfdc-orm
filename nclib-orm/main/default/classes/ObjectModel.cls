public abstract class ObjectModel implements ModelInterface{
    public static System.Type modelMapper;
    
    public virtual ModelInterface init(sObject sObj){
        this.setMapper();
        ModelMapperInterface mapper = (ModelMapperInterface) modelMapper.newInstance();
        mapper.init(this).run(sobj);
        return this;
    }
	public abstract void setMapper();
    
    public abstract class ModelMapper implements ModelMapperInterface{
        protected ModelInterface model {get;set;}
        
        public ModelMapperInterface init(Object model){
            this.model = (ModelInterface) model;
            return this;
        }
        
        public abstract void run(sObject sObj);
        public abstract String getQueryString();
    }
}