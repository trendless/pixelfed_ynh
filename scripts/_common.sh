#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

php_group=www-data

_update_app_locale
    current_locale=""
    if [[ -f "$install_dir/.env" ]]; then
        current_locale=$(grep -E '^APP_LOCALE=' "$install_dir/.env" | cut -d '=' -f2 | tr -d '"'"'"' | tr '[:upper:]' '[:lower:]')
    fi
    
    new_locale=""
    case "$current_locale" in
        af) new_locale="af-ZA" ;;
        ar) new_locale="ar-SA" ;;
        bn) new_locale="bn-BD" ;;
        bs) new_locale="bs-BA" ;;
        ca) new_locale="ca-ES" ;;
        cs) new_locale="cs-CZ" ;;
        cy) new_locale="cy-GB" ;;
        da) new_locale="da-DK" ;;
        de) new_locale="de-DE" ;;
        el) new_locale="el-GR" ;;
        en) new_locale="en-US" ;;
        eo) new_locale="eo-UY" ;;
        es) new_locale="es-ES" ;;
        eu) new_locale="eu-ES" ;;
        fa) new_locale="fa-IR" ;;
        fi) new_locale="fi-FI" ;;
        fr) new_locale="fr-FR" ;;
        gd) new_locale="gd-GB" ;;
        gl) new_locale="gl-ES" ;;
        he) new_locale="he-IL" ;;
        hi) new_locale="hi-IN" ;;
        hr) new_locale="hr-HR" ;;
        hu) new_locale="hu-HU" ;;
        id) new_locale="id-ID" ;;
        it) new_locale="it-IT" ;;
        ja) new_locale="ja-JP" ;;
        ko) new_locale="ko-KR" ;;
        me) new_locale="me-ME" ;;
        mk) new_locale="mk-MK" ;;
        ms) new_locale="ms-MY" ;;
        nl) new_locale="nl-NL" ;;
        no) new_locale="no-NO" ;;
        oc) new_locale="oc-FR" ;;
        pl) new_locale="pl-PL" ;;
        pt) new_locale="pt-PT" ;;
        ro) new_locale="ro-RO" ;;
        ru) new_locale="ru-RU" ;;
        sk) new_locale="sk-SK" ;;
        sr) new_locale="sr-CS" ;;
        sv) new_locale="sv-SE" ;;
        th) new_locale="th-TH" ;;
        tr) new_locale="tr-TR" ;;
        uk) new_locale="uk-UA" ;;
        vi) new_locale="vi-VN" ;;
        zh|zh-cn) new_locale="zh-CN" ;;
        zh-tw) new_locale="zh-TW" ;;
        *) 
            ;;
    esac
    
    if [[ -n "$new_locale" ]]; then
        ynh_write_var_in_file --file="$install_dir/.env" --key="APP_LOCALE" --value="$new_locale"
        ynh_app_setting_set --key=language --value=$new_locale
    fi