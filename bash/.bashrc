# custom bashes
alias bashfile='nano /home/settings/bash/.bashrc'
alias ll='ls -lah'
alias modules='cd /home/data/www/modules'
alias hosts='sudo nano /etc/hosts'
alias 2magerun="php /usr/local/bin/n98-magerun2.phar"
alias refresh='2magerun set:up && 2magerun ind:rein && 2magerun c:f'
alias grunt_init='cp Gruntfile.js.sample Gruntfile.js && cp grunt-config.json.sample grunt-config.json && cp package.json.sample package.json && npm install && npm update'
alias grunt_start='grunt clean && grunt exec && grunt less && grunt watch'
alias elasticsearch='/home/programms/elasticsearch/bin/elasticsearch'
alias updater='composer update --prefer-source -v me*'
alias magento='dev/bin/magento'

dbrefresh_m2() {
    tar xfvz $1
    2magerun db:drop -f
    2magerun db:create
    2magerun db:import ${1::-7}
    rm $1
    2magerun set:up
}

# PhpStorm Debugging
export XDEBUG_CONFIG="idekey=PHPSTORM"

#Git bash-completion
source /usr/share/git/completion/git-completion.bash

# MyIp
alias myip='dig @resolver1.opendns.com ANY myip.opendns.com +short'

# server connection settings
#festa-verlag
alias de_festa-verlag='ssh de_festa-verlag'
alias de_festa-verlag_test='ssh de_festa-verlag_test'
alias de_horrorundthriller='ssh de_horrorundthriller'

#timeshop24
alias de_timeshop24='ssh de_timeshop24' 
alias de_timeshop24_test='ssh de_timeshop24_test'

#messerspezialist
alias de_messerspezialist='ssh de_messerspezialist'

#okapi-online
alias de_okapi-online='ssh de_okapi-online'
alias com_okapi-shop='ssh com_okapi-shop'

#porta-kosmetik
alias de_porta-kosmetik='ssh de_porta-kosmetik'
alias de_porta-kosmetik_b2c='ssh de_porta-kosmetik_b2c'

#urkunden
alias com_urkunden='ssh com_urkunden'

#frauenfreude
alias com_frauenfreude='ssh com_frauenfreude'

#mediarox
alias de_mediarox='ssh de_mediarox'
alias de_mavento='ssh de_mavento'

#schmuckwerk-shop
alias de_schmuckwerk-shop='ssh de_schmuckwerk-shop'

#schwerlatregal
alias de_schwerlastregal='ssh de_schwerlastregal'
alias de_schwerlastregal_relaunch='ssh de_schwerlastregal_relaunch'

#sporttheraphieschule
alias ch_sporttheraphieschule='ssh ch_sporttheraphieschule'

#autohaus-krumnow
alias de_autohaus-krumnow='ssh de_autohaus-krumnow'

############ git stuff

alias feature="git pull --all && git flow feature start work"

release() {
    git flow feature finish work
    local version=$(sed -nE 's/^\s*"version": "(.*?)",$/\1/p' composer.json)
    local nextVersion=$(sed -nE 's/^\s*"version": "(.*?)",$/\1/p' composer.json |  awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
    git flow release start $nextVersion
    sed -i -e "s/$version/$nextVersion/g" composer.json
    git add composer.json
    git commit -m "[*] version $nextVersion"
    git flow release finish $nextVersion
    git push --all
    git push --tags
}

#############
