#!/bin/bashi

# Общее число папок, включая вложенные
num_dir () {
echo "Total number of folders (including all nested ones) = $(ls -lR $1 | grep ^d | wc -l)"
}

# Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
num_top_5_dir () {
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
du -h $1 | sort -rh | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %s\n",i,$2,$1; i++}'
}

# Общее число файлов
num_files () {
echo "Total number of files = $(find $1 -type f | wc -l)"
}

# Число конфигурационных файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
num_some_files () {
echo "Number of :"
echo "Configuration files (with the .conf extension) = $(find $1 -type f -name "*.conf" | wc -l)"
echo "Text files = $(find $1 -type f -name "*.txt" | wc -l)"
echo "Executable files = $(find $1 -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find $1 -type f -name "*.log"| wc -l)"
echo "Archive files = $(find $1 -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)"
echo "Symbolic links = $(find $1 -type l | wc -l)"
}

# Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
top_ten () {
echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
for num in {1..10}
do  
	list=$(find $1 2>/dev/null -type f -exec du -h {} + | sort -rh | head -10  |  sed "${num}q;d")
    if ! [[ -z $list ]]
    then
    	echo -n "$num - "
        echo -n "$(echo $list | awk '{print $2}'), "
        echo -n "$(echo $list | awk '{print $1}'), "
        echo "$(echo $list | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
    fi
done
}

# Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
top_ten_execution () {
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
for num in {1..10}
do  
	list=$(find $1 2>/dev/null -type f -executable -exec du -h {} + | sort -rh | head -10 | sed "${num}q;d")
    if ! [[ -z list ]]
    then
    	echo -n "$num - "
        echo -n "$(echo $list | awk '{print $2}'), "
        echo -n "$(echo $list | awk '{print $1}'), "
        path=$(echo $list | awk '{print $2}')
        MD5=$(md5sum $path | awk '{print $1}')
        echo "$MD5"
    fi
done
}

# Dhtvz выполнения скрипта
script_time () {
end=$(date +%s)
echo "Script execution time (in seconds) = $(($end - $1))"
}


# Написать bash-скрипт. Скрипт запускается с одним параметром.
# Параметр - это абсолютный или относительный путь до какой-либо директории. Параметр должен заканчиваться знаком '/', например:
# script05.sh /var/log/
# Скрипт должен выводить следующую информацию о каталоге, указанном в параметре:

# Общее число папок, включая вложенные
# Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
# Общее число файлов
# Число конфигурационных файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
# Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
# Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
# Время выполнения скрипта


