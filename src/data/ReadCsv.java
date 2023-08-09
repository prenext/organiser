package data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ReadCsv {

    File file;

    public ReadCsv(File file) {
        this.file = file;
    }

    public void readFile() throws IOException {
        List<String> list = new ArrayList<>();
        BufferedReader br = new BufferedReader(new FileReader(file));
        while (br.readLine() != null)
            list = Collections.singletonList(br.readLine());
    }


}
