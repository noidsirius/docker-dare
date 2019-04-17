# docker-dare
Docker Dare Project (http://siis.cse.psu.edu/dare/index.html)

> Dare is a project which aims at enabling Android application analysis. The Dare tool retargets Android applications in .dex or .apk format to traditional .class files. These .class files can then be processed by existing Java tools, including decompilers. Thus, Android applications can be analyzed using a vast range of techniques developed for traditional Java applications.


# How to use
Put the input APK files into a directory (for example `~/docker-dare/Example/APKs`) and make a directory to store the retargeted classes of those APKs (for example `~/docker-dare/Example/dare_out`). Then run

```docker run -v ~/Example/APKs:/APKs -v ~/Example/dare_out:/dare_out noidsirius/dare:0.1.0```

Alternately, you can build the docker image by cloning this repository and run
`docker build . -t=yourowntag`.

