public interface ModelMapperInterface {
    ModelMapperInterface init(Object model);
    void run(sObject sObj);
    String getQueryString();
}