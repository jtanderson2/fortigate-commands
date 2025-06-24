# active-passive ha config with override enabled, session pickup and reserved mgmt interface

# fgt01
config system ha
    set group-name "FGT_HA"
    set mode a-p
    set hbdev "port9" 0 "port10" 0 
    set session-pickup enable
    set ha-mgmt-status enable
    config ha-mgmt-interfaces
        edit 1
            set interface "mgmt"
            set gateway 10.3.0.1
        next
    end
    set override enable
    set priority 150
    set override-wait-time 180
    set monitor "External" "Internal"
    set ha-direct enable
end

# fgt01
config system ha
    set group-name "FGT_HA"
    set mode a-p
    set hbdev "port9" 0 "port10" 0 
    set session-pickup enable
    set ha-mgmt-status enable
    config ha-mgmt-interfaces
        edit 1
            set interface "mgmt"
            set gateway 10.4.0.1
        next
    end
    set override enable
    set priority 100
    set monitor "Build" "External" "Internal"
    set ha-direct enable
end

# failover to secondary when override disabled by resetting ha-uptime
diagnose sys ha reset-uptime

# troubleshooting
get system ha status
diagnose sys ha checksum show
diagnose sys ha checksum cluster
diagnose sys ha checksum recalculate

# manage subsidiary unit
execute ha manage <id> <username>


