package custom;
import dao.daoImpl.*;

public class ObjectFactory {

    public enum ObjectTypes {
        APPOINTMENT,LOGIN,PATIENT,TESTRESULTS,QUERY
    }

    private static ObjectFactory objectFactory;

    private ObjectFactory() {}

    public static ObjectFactory getInstance() {
        if (objectFactory == null) {
            objectFactory = new ObjectFactory();
        }
        return objectFactory;
    }

    public <T> T getObject(ObjectTypes objectTypes) throws Exception{
        switch (objectTypes) {
            case APPOINTMENT:
                return (T) new AppointmentDAOImpl();
            case LOGIN:
                return (T) new LoginDAOImpl();
            case PATIENT:
                return (T) new PatientDAOImpl();
            case TESTRESULTS:
                return (T) new TestDAOImpl();
            case QUERY:
                return (T) new QueryDAOImpl();
            default:
                return null;
        }
    }
}
