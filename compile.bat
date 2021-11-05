path = "songs\"

cls
sjasm.exe -l main.asm output.bin output.lst
bas2tap -a10 loader.bas loader.tap
bin2tap -o main.tap -a 32768 output.bin
bin2tap -o PTZX.tap -a 49152 PTZX.bin

copy /b loader.tap + main.tap + PTZX.tap  1output.tap


@del "loader.tap"
@del "main.tap"
@del "PTZX.tap"

@move "output.bin" "maps\"
@move "output.lst" "maps\"
@move "PTZX.bin" "maps\"