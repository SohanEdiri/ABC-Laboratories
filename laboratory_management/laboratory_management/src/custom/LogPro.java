package custom;

import java.io.FileWriter;
import java.io.PrintWriter;

public class LogPro {

    String logFileName = "c:\\error.txt";
    FileWriter fw = null;
    PrintWriter fout = null;
    public boolean timestamp = false;
    boolean systemout = false;

    public LogPro() { }

    public LogPro(String _logFileName)
    {
        logFileName = _logFileName;
    }

    public void write(String text) {
        try
        {
            if (systemout)
            {
                System.out.println(text);
            }
            else
            {
                FileWriter fw = new FileWriter(logFileName, true);
                PrintWriter fout = new PrintWriter(fw);
                if (timestamp)
                {
                    String timeStamp = new java.util.Date().toLocaleString();
                    text = timeStamp + " - " + text;
                }
                fout.println(text);
                fout.close();
                fw.close();
            }
        }
        catch (Exception e)
        {
            System.out.println(e);
            System.err.println("Exception in kapruka log writer" + e.getMessage());
        }
    }
}
