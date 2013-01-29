class common {
  include common::data
  
  define line($file, $line, $ensure = 'present') {
    case $ensure {
      default : { err ( "unknown ensure value ${ensure}" ) }
      present: {
        exec { "/bin/echo '${line}' >> '${file}'":
            unless => "/bin/grep -qFx '${line}' '${file}'"
        }
      }
      absent: {
        exec { "/bin/grep -vFx '${line}' '${file}' | /usr/bin/tee '${file}' > /dev/null 2>&1":
          onlyif => "/bin/grep -qFx '${line}' '${file}'"
        }
      }
    }
  }
}

class common::data {
  $internal_network = '33.33.33.0/24'
}
