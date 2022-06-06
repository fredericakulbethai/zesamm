<!DOCTYPE html>
<html>
        <head>
                <title>dplayer增加记忆+P2P播放</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><!-- IE内核 强制使用最新的引擎渲染网页 -->
                <meta name="renderer" content="webkit">  <!-- 启用360浏览器的极速模式(webkit) -->
                <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0 ,maximum-scale=1.0, user-scalable=no"><!-- 手机H5兼容模式 -->
                <meta name="x5-fullscreen" content="true" ><meta name="x5-page-mode" content="app" > <!-- X5  全屏处理 -->
                <meta name="full-screen" content="yes"><meta name="browsermode" content="application">  <!-- UC 全屏应用模式 -->
                <meta name=”apple-mobile-web-app-capable” content=”yes”>
                <meta name=”apple-mobile-web-app-status-bar-style” content=”black-translucent” /> <!--  苹果全屏应用模式 -->
                <link rel="stylesheet"  />
        </head>
        <body style="background:#000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" oncontextmenu=window.event.returnValue=false>
                <div id="dplayer"></div>
                <div id="stats"></div>
                <div id="play_icon"></div>
                <script src="https://cdn.jsdelivr.net/npm/cdnbye@latest"></script>
                <script src="https://cdn.jsdelivr.net/npm/dplayer@latest"></script>
                <style type="text/css">
                                body,html{width:100%;height:100%;background:#000;padding:0;margin:0;overflow-x:hidden;overflow-y:hidden}
                                *{margin:0;border:0;padding:0;text-decoration:none}
                                #stats{position:fixed;top:5px;left:10px;font-size:10px;color:#fdfdfd;z-index:20719029;text-shadow:1px 1px 1px #000, 1px 1px 1px #000}
                                #dplayer{position:inherit}
                                .dplayer-menu.dplayer-menu-show{display:none}
                                #play_icon { 
                                                background-color: black; 
                                                height:100%;
                                                background-image: url("data:image/gif;base64,R0lGODlhxgL0AdUAANzc3NLS0sTExLu7u7Ozs6urq6Ojo5mZmZGRkZCQkI6OjoaGhoWFhX19fXx8fHNzc3FxcWpqamRkZGBgYFhYWFZWVk1NTUxMTERERENDQz4+Pjo6OjAwMC4uLiYmJh0dHRoaGhMTEwoKCgQGBwAAAP4BAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQFFAAlACwAAAAAxgL0AQAG/0CScEgsGo/IpHLJbDqf0Kh0Sq1ar9isdsvter/gsHhMLpvP6LR6zW673/C4fE6v2+/4vH7P7/v/gIGCg4SFhoeIiYqLjI2Oj5CRkpOUlZaXmJmam5ydnp+goaKjpKWmp6ipqqusra6vsLGys7S1tre4ubq7vL2+v8DBwsPExcbHyMnKy8zNzs/Q0dLT1NXW19jZ2tvc3d7f4OHi4+Tl5ufo6err7O3u7/Dx8vP09fb3+Pn6+/z9/v8AAwocSLCgwYMIEypcyLChw4cQI0qcSLGixYsYM2rcyLGjx48gQ4ocSbKkyZMoU6pcybKly5cwY8qcSbOmzZs4c+rcybOnz/+fQIMKHUq0qNGjSJMqXcq0qdOnUKNKnUq1qtWrWLNq3cq1q9evYMOKHUu2rNmzaNOqXcu2rdu3cOPKnUu3rt27ePPq3cu3r9+/gAMLHky4sOHDiBMrXsy4sePHkCNLnky5suXLmDNr3sy5s+fPoEOLHk26tOnTqFOrXs26tevXsGPLnk27tu2pHSBA6KClw4ULXUBIQEBAQAABBBBIAFGngwMlDiBogMJ8SXUsIH47oaA7iQbd19GEF6ThAm9c5c8fGQ/ywoABwLNAeL9Fg4EAAQ44kEBBgoMD+BkwnRTuDTCFBuoRAQIBA0CQxHsUPKFBAQwsoYCAUoAwoBAFFqH/AXsLNpjEAQMYoAYFBSjwBX1adGgEiQ6SgOATDmzoRnm/5ajjjjzuyF4UMCLBAIYjFRgfFvMZiB2ABlwgwhEiXHDfAT8q4SIJvv2m25YMHOAlg+8dgMR8BCQ4RIFVHiHBexWO+Z6K6/3GHQRfakBAmWeyOIQBBERIBAMDFFBlgRKosSZ8RXip6KKMPvegkkJsKemkWx5JxJVEBGknAZYmocAAfVKR5HuklmrqqWIOQeKprLZaaqdSBGmEnaBuSOmtWxbqkJFaJIkFBgIMYKN3AwiAARRXUuDqqQbAeUQBA7RZhAMDpPrEodISQasB7HWwrH0lVodpkpYWWACjipKw/yq6ig7bBYkFFLFsqdZyeKSeJMxbqoPZ6UiujtMFCcKquioxcK1TSMCuogwasLB+RPzH7nsOMxzowgPi2p0Sss7KIAED6kvvQwWK7ISvVlAQAAJPOiECAgHAmsSVGnipgKTQQnDBgB8qIQEBMRZhgIhRJOnoECAMjecRd3rJ5m/MdcAgnFcWGDQJIEC77KiuyrwFr0O8p3OPFwBab76Q4ktpmJQCV/KyYs4XNKDRNjG0oO8iasV7lnaMxLJL+O3hx8w9zCi0Zyv09rxIk/0b3Y7vvIQGATgwAgkjpGkEAwG4iwSmAxesrt4kXEAAt0L0uyMFO07n7QBmOsGAA+MBCv9yE3wXoayILoZ49qecXgAB6/4yyICWPWoun5m5u3m2nmJvWcTrfhqRm6R0T1qo3H82bzC0zp6ssW7QMjC+zkt4P/rVR1C86NCQIiH44KIzMV/iCYHdxOIim4o/0gJAABEcprwhIEAAmpMY/NJFK2mRKD6HChr/WCUmajGOBFzrH6tgpT4hAMpBLpoP3oZAt+m453apGxrqSJStMAjvVrry3n8Kdj95pc1URShQ7D6HryHMp4UMqN/MOpg+DW6tcTwSm46GdrzWEUF9mDrC/Lw0oAIWoYa7IuIQjYiqJIyARC0Twn0CAIEwJkEE1eJYq4QwoQHA6YEYfI/oJthFMAH/Lo5c3KARiKghDulJAjaiW8FsNyDhEamBZMggqVLlvY5hMWw31NEVA/WEKEYqjVUAVLyeoESyDW1sPfpknvI4MkiWiz5GjJEWm/BIhujvCiiTAuWGNcYAwOdySqDcsZCAo38daWADguPAvLY+JERwR0zUDpZ2lCRQ+quTOWIPFJnJNycmbQD1I6AQoEgAIXrhhZJ60zZJ50hMQvKcEVMUtAiArukojFELRNc6H+a5RImNk6R7UT7tKcHobYlNOKuWpEhULyiiUoOqJF3NDHe0OP7PH9ejFN3MhytiHiGWUTCAiYSGn44WYIcD3KiVWETHefWNaEbQWvWEML9LafGV/0N4p9NKlC4NpkpDPCLeb6ApJx2B1AuHik8jUdpKtKFTVfoCjiJJSSqLYo1UBLAi2oDTxQfyz0Edi6L6/NZKgxoocsn8zXm8V9IwEaGoASnrvNi3BIw+AQQxM0ItOxoABqTpAgFQnosWuqhSMehcjLJRS0fFvlX6cZ+HldlSSYW2ii0McU9kKqnY+oUQHW2oQSsq9OI3uiYmEbFYYgAFfuQekUrhUAyirBQPMB1KFeqBEa0UCWY4Shue9Gpdzacl+blH0pW2R61EK0AKRNHz/ROlrOyhEyQgADOKka50FUAZjzCCAHjTpZwlYbVIRIE7XZelyBWC1AI1gIairZ6JPf8CTMWbIwuCcqpKaKXhVuVYdn2XC58aIXzBm1lzzlRRYWpXS/dbBE2SVrlP+JQByCTVwIGWh5zdKnJze8rs8ta2ecKfe+ol3H+sVwn3fIJbnYAA0+4JutAF7QEEOFID9TF1JOLWA2mlgCqxkEfUWrA5S4dg7Mrsw93Lp2Edik+nJlJ93kutD80psgvI6pFEpB4SXkeE3FjxdRAIkWofNTKrnoqyVgtntAJ6gIHumKcoczKs5kfWHWf4rG5O65B720/J+s8IBDDvc1EMXQOYyQEEWILVgMYhaK0QUbTKc+xWdaqklQdURFiTiY3wYSCnDkyWGnKH2/dgM+zOvN7z3iP/IxfNJzNZb4xeK9rUQ61NtvU9vLFdgzGovdGZp23qtfOZXQXeSbPZt3HmMYeD7eE527DOujZrEQTgzbnyuaO0i6kAlnAoNoFgotWBI9YYbYCVwu9UWMPSezYEqBZS+qVDrjZ3IFncWxE0UsYF6PmMTAValfcABQs16Ta94QtDWW8Sm+fCCsWg+ITovpd2o3hDjAYj6cgBCtAp2cwW2frCb+Hh/fWRTsiuoQ37of2wNKeDpjrHQY7U7grASk/8bBQL4DwqQ4JwtBYo3XxMdBLYDRFQNO7IbhxfORsCtEQnsfe5D13wq6+XCvZtJaNNZIxM9mS/YO8SyXGc8XmdrdwM/wJxudnU1lJf1kSUG2+a2tXx9Z6sOTbfti9KV/1SEINAvkwbeVW7Uc1UeAms1o8bROR0hsKIm8DsIzi75R+VNhLsSJ9qt3t85sOwH+sFqI1q4D3hSbWuY+QerVkwQvLG1btpbdzSo68L2/pkkgrVPKvpqqjUAiEms020f1sqx5M/AqCeI2XrzL3K79FzZKW+9yFQK+9RuLt4jad3tra5STwKLrH9USClz5fhQ8jSRRHcryrl2fAt76gAKIBLIQBafgJlkQQUhtDe/rxeu4u1wiNNqVXhaqK4Hp0FL3D8y3eayFRgbFnQf0FSQs0zKqlSVEMnbB7UJGBnSqNUSMFWQ/+fQnfm10EWhF5MoCyB1gSap2tUpVtqA2tI5XzApmE7tmkhJ1lsNXiDB2QlBn7hN11CEz5n5Tb4AiNL1CA68kEegnlLdjYMQjtX92oWxmMPpkO580maNn1MIIBY0F0BQzRBtF/floA7dkK55390QoXzR2Akwk5eojSMcli7o4GHlTghMmk08oUORnyIonwJdzQa92bn5ncFYTWktiPYd0kW9oKrxFzORQKH11FUAiWF12J6d1KWwj3YBWdnc3ya1ASTmGsPxkLwpQGs93+P5HaMcnSKgnBVEEwZx1ri5kaYpDAN9Slt0m8qVEywCIYmM059uB5as0OHInzZpzGIcz7/SmBgSLB/fyOCnCUBt+V+dphDKeiE/HA9P3VRpwdnf4hgQAZXsFKIKKReeSVoOZhP2nZJ7CN9Z/M6RbgEUwNhikWCSNY/YSd1W6YFA0YClVdUFxA1JChsJQSLEAKBPPQ/n1IiTfCPW7YqK4ddkpUEa5KNRZCLj1JhDmaCPyeG8LSMFqgPFFA9wnE1HcAA4QMCEGCDfrh9FmZpGiVX0DV+5Wd4bKiM8fOBrsI+n9JQ8wGSFrSSC1mOLCkz1OIo6wh1Z8JMxug4PGUeIgYBonhhsyJHRXUA3fQpznJCRRgkh3IdhtVvR/CPjegudANy46WQPpYj8wF9WlIiz3SEiRZE/+NxKDZJYEj4kMh4WK6ChwMxdjGyO9fhfz+3dy5IjYY1SxwFbSKQkrPSOUyAKTG2KA2zKEFHBAyyUoJzTT23BOs0KFokNdWxjhbVYZuCXlCYlMWnRpR1TXHjZjkDLb80USVIAlpzAGP1YLlRIlvyH7wxKqITmR70HvplTO/hlYflUvVilb25HsNRKgv2If+IOo9icT2WmpLHY2LJIzaigvuQJOrhdGJUN3hnJns5kkMGRgOEH6zJBGhUkYbpjfnkiEKQkEiJNUrzMRqYPVvkNeqBmWn3P5B5XZ05SbADJMUXhq3lZrmzUklibvK4m2IzHgpwADTHa6gVKNUBAvhCN/+8eQQWxCnnFj/AyYC1ZTASoACMZ21FtEag+ZYaaj/MmA9c2D1odyjqMV42uJ2WaFEgEEDlxye7xAQHBAKCaYmL2KNLdjXlUwSLKSPrpAH2dl1q2WJGRp9JsGkHU3z5SQQKFivhdZ+XVC8QKiwK8o8Emj0dsCoFcFKkci53UynCwyZY5kcbBQL/OKFCMnWPmIwl2pZN8KWncjM/FXoQQDdLIErNWTQnig93Ex5niDTWiUeNGGCHo6hG938yUjlDgAE7Sl0OEAA3yo0tyYM58kk9SFSwdgHEg5VC0F0IIyNgogB/tpsaCHhsOWQU94vYZD1ROgSH6gR+cwFaQ0Olem3/+IKrtQgu2IlBYBJty6SM1sKr2Ll6s1VepaM1bpoEdBMoG4IpGVqty4k1FOAATecADMB4BeAAHESMVVaPS7Z3swpeFWkPn4dnzKpdaLeG0shURqYyLPMELxNXSxCq3dg/dckmSEgqJgICFWojbQQqWYYlq/Ks6VVEmZZPXxodexp8hSkjDrMlkzkFr/OM6Md5CWsp5GgqbdIBbdopGwmn2QemXmOVwHo1C3R1dFMAaPimbkitWVgtFEBRSqMtL6SgpmIAyzEEN8t4BGBX/MhGXrJzrRI7AvilZaYb8POO+TCTFHo8l3KwkKge4GR6ugE5TQAsWsoEl2csTWBB4oRU/49Xf0STkMyRpW/SAWNXLSDyj6lyKDBbmMbGpJDkVxo7fKVylGoCkFTqIKNCtDn0baBCtGRLuDC2SPWUJCCZe6baTUUAmZTEUjVWBRRwiBsKuZO3OFdTbVClHD8VtMoGBf7nV94EhRQ0a/TQM1WQHVmwUDGbQgHQJINIAlEyJVKFgAnyH2ioMAVTIz7zmaOKnLNFrJNDRUygvKpiivQnKbOWc5Kyt9BKvNCBbx7EANQ7OAcgM2vSvZNjvB4CMWwEUnSivUjjBQtVlLoBKwVQsRKwvaOKvgSyI02qc00gvVsyu0CBAWOkH/zhHwZgHAZwqXfAutOgOfJ7G4cgHMRhHP/IoRw6ysAUXMEWfMEYnMEavMEc3MEe/MEgHMIiPMIkXMImfMIonMIqvMIs3MIu/MIwHMMyPMM0XMM2fMM4nMM6vMM83MM+/MNAHMRCPMREXMRGfMRInMRKvMRM3MRO/MRQHMVSPMVUXMVWfMVYnMVavMVc3MVe/MVgHMZiPMZkXMZmfMZonMZqvMZs3MZu/MZwHMdyPMd0XMd2fMd4nMd6vMd83Md+/MeAHMiCPMiEXMiGfMiInMiKvMiM3MiO/MiQHMmSPMmUXMmWfMmYnMmavMmc3Mme/MmgHMqiPMqkXMqmfMqonMqqvMqs3Mqu/MqwHMuyPMu0XMu2fMu4nMv/urzLvNzLvvzLwBzMwjzMxFzMxnzMyJzMyrzMzNzMzvzM0BzN0jzN1FzN1nzN2JzN2rzN3NzN3vzN4BzO4jzO5FzO5nzO6JzO6rzO7NzO7vzO8BzP8jzP9FzP9nzP+JzP+rzP/NzP/vzPAB3QAj3QBF3QBn3QCJ3QCr3QDN3QDv3QEB3REj3RFF3RFn3RGJ3RGr3RHN3RHv3RIB3SIj3SJF3SJn3SKJ3SKr3SLN3SLv3SMB3TMj3TNF3TNn3TOJ3TOr3TPN3TPv3TQB3UQj0T+AEARX3UYqRRSr3U2csATv3UTp2e6zfVVC0EGHDVWJ3VJ23UAcDVXB0AQvC+Ym0A/2Pd1FD91FJN1VVNAlnd1gYs0l191HENAGI01nZt1mfdJmqt1lbt1lht0tU114Kd1EvN1PKY12hNAnu91n791yYt2F4N1oRo12RN1nh91mm92H3d2Fst118d1pVN2ZcN1Zm915vt1ycd10dt1HRNiIVt2Iid2Is91aft1qkt2EitmqG926Mt27OtK4191anN2rh9Obt914cd26XN12wd3J2t2sRN2K+9UbEd1Yr927Xd1jWNS9w91N793eAd3uI93uRd3uZ93uid3uq93uzd3u793vAd3/I93/Rd3/Z93/id3/q93/zd3/793wDOEh7gAbfbBB9Q4CLgAU1Q4F7AAf8M3gYfQOBb8AEGLuFZEALiWQUJbuF24AEWsAFxkOBTsOFJEOEUvuAKjgQWYAEYrhVekuJRsAEH0AC3awEHUAFMMAEJAOIvcgAKLgIPYAFV4AFe8uBDQOTp6gQ2LuRF8AA+LgQwbgRh5OQwbkYLcAA8ngRUrgURcAAcgAQf0AA0TgVIHuVnYOZHYOMPAAZH2wQekAAJ0OJQ0OUTgAQh4CVf3gQ2XuerheZLAeQnnihPXgQf8AAP/gEJcAARYAQhkOhMfkaJ7ucvTgIfcOUPIOdD8ACavumbTgR07gRIzgVLbgRbPgEHMAHOBeQNkOmDTuRMLgJeEuhIsOVCwOm2fuv/DyDrQpDoCH7lfC4FZa4Ge74Ean5GA37syJ7sA97jT3Dliw4FSI7pRGDqz84EH+AlGSA/gy4FITDgRu4SNp4Auq4u2y4EItAAB7DmSsABXvLotZ7uTFDsR5DoPC4CXZ4Aed687HLkXjIBK/7vK57l/J7kUJLspj4ByE7hW/7mM67rTo7jJLDlIuDoQsDuC8AEtE7unmjm7F7tR4Dk+Q7tk54GMn7qUO6Ji0ICSO6JzA7qI+8E6J4AuL4B1z7juJ7rRCACzj4i5Q4FNt7zNWHq4i7oUX7uBzD05q7sA94AC8AByM4B6O70yh5GEw/07+7uw54pZ9PmEW846k4Eoa7i/wA/9im+8g+z5jae4iEQ8yHf6F7e9QqO7r9eASa/BBn/4kqP7Ohu5nQv8EdQAQvg50wQ7MLe75SO61cu87h++Lae+Isv6FDg5BfvBHT/MBaA7oYT5V2+AC0z9ive754v7Sr+8jjh5EjPUuVu6m8/8Cj/MDBu4x7f5Afg7irf8s0rBCWv9L4+BBHuARmA98je4obD5CEw9k4e5P8O4mk/BEb/60KQAYEP928+5kJw5SE/69vO9Vr+5D+/MBrfdm5O+mig+rQ/BPLuBKYO8YFD8Eie7UxQ8k6fARuQ7Pc+4Bkg9cgeRkIf6K0v+EXw80DgIQ2JReMRmVQumU3nExqVTv+pVWtV1DgkQsTDQTicfDfGzwOdVq/Z689QlDh0SaLj42Ahhjwby6Rs6MtoMI7MiGPLbgjvy/ExT/BgwqKyciESySKzaDOjSETvaBFP6GORxAMS0kJ1FWyQqZRkA01rYY2kbdfJNezKqiHCLsTSEm/B2JLuCPO3U/mrMtBo86FoLAE1aeNQNeFt6ONL6Dv8aPOAmkS58otSmXkp/RnY/h4/X3+fv98oRE6DReTEHPJHZEyFISEmLfrg4dYDTJAieDlA6CIeLdqIGPpEpIKtL2rkiCJYBI8odJyIbFKJ5NUqPWNwpcGU4MEGV6tctWvnrEgFdUo+yNv2xNfBJqh2xoT/VE/cliROD1xbaXWhtCXdhhbkQqIYIIRSj4zpuuTkFK5QlbZ1+xZuXH3jJlgUImLMOnx+mH1bFKFqBTkxcUawkOEcOQ+Le24pdqBiHS1YjbhCmSkto0hNqXauqkvNxAZqNjAE0+mzkVmSPGfGJCLkOSINEoT5kOAlo10iD4zenfOtCMaMxzQYzvjokAyTkrSTZoEaM2tGxtQd4uHBs9t6KV1PTeQBhyOJumJnSyJzlKRy2bd3/979s7Tnh9T6HU74udUktARy9SEdXDCJwAPZjnBqO8mYoyk57y4CD7PTLtPjjN/UiKgNhYq4jZxtzBKPCMBy00VC9PLwyRigoqpo/78hNllgEa6ss6i1zkaEazol0vEMqliKAEyhHPeQBw/K6vAAxT8OSCbJX4AbQovIDixRivXguxLLLLW8Ij0dOwtDFaxW4yoNORQKQTrImnjuOT1+4fAmA4uwDEKTqCTxRgsaALGyAzRkgquAFghnHK3qvKNEHyF80wNUxhCvxUKfkXHO444T6oAMLD1OHnt2HKRCNm7apYwXH8BwCzTk6PHBIjDRQ8gkrHSxxphUQmW5BDjY5Qvf3Ghi1i2FHZZYuBqplRXUblwtzEWjggTGq5qoRBIluDqATySahTCQ9FIaZVVtv6sDCUxrgewQZNQkIlzVEm3V2SQSSECzX0TA5P9PIih1Ip2PcIQkFWQdgXUzzKwqZYMGEoO3DoJiTaLIypKkKclWjgAoU85ao48IVxosFuSQRabiWIENpXVZCbcl8RcPusCYrW6s4sOPCB6obUpuBtvCgo9XZlmSer6lxRLAcGvH5XEXMI6IDzaCFIwN5ABE1yU7+qJToO1QbDgtNOWUhESs208jbt5xArB121OUCpcCNulgMJabkW3yaDVS3DuV+NmJyY7cFPDFPp6T7ZENPxzxfIZGGQlmv2tRs3yP5MCsiWRiRMPCQ2jkgRDSTqCCrH9ezdtMSnZKD7ICnkO5XsOZ5TaBTvlikUToRTSkBkysVQ/AQFwtGz7+aSD/A6EEamLnwZVS1I+Kl2mpYLjrZeh2E40w/u6+x12CbyYwvREmvbkvPPHyzT9/icXZWbKNdleGfLloSXDaqcIOc9kLqxT9wKwE/OXAcg1YR6xId6ehPcQD+AJcFzABoRkBpAJ2EMEGMmABOpxiNl0RipQWkoGd0WskawgIG8oQwpv1Bg0c0JUW5LGcivSsCYXCg17goqjTOeUXblOF9ICmBRCxTQsaepjZTvMpkz1CFNcC35Q4dgQ6oQ+KUYSi+ozIE++IiUocko0jRoMpf12HEPqrChp2FIGsbWAi2drEjIBmIqGxJBG6a+NlhGC7bTBDKHgDybq81jEtOCICP2TY/xwxEhNyjeElmKChEorTjQW4x4YZC5wWchg9QcRNCHOr1h5OMkR5MaeKRyzYFjIROMZ84Wv4Y8ITpdhKV4qMiiyJ1/tKlIVSbkAn7hqgn4qQGkgAJDvcYyMJRFSEdpVOJRh7nd48cS+WFMMSXzCMMahBHhGYhhkyUtE4HumuJtbLDFbzDkecYJoyyGGRbYkkx/ajQ4OBcxy3Y56PPKkJrE0BSWzh0APctjveAYt8rxToQO3RPOf9hCX99OYV48WfkexMciSojr4McslNwuGGTzmCD3spIWSGqDeWwAQ8KlFHyLyoT52hzKuw17QM2MFxeIMcxPSGh4/gIaJKMBqt5P8Xl0j6qn0lcicPV/OACFoPpFKq58XOJgWFFoEhAumnhRrhq3SCAg0E1epWr5DRGr3kqbN8XIn++AWcVAAqjqxPRS2KVAhRhVVb9KgBOeFVJIKFlHcSjgeEUpvhCIWNm5jXWRZKgrmFSlUoVANNoeIX8mQtCeQJhCGG6ZZIbgx6bnonIS8qAlRCT49zWgQl7ICkgx6jKsoIw1HDep4ucRW2sd3LaREK1i8xFJwuqoCmlIdNcx1IjIUV7hBsh5EwfFQcx/HacOjwx5zWQZGgwIRsDKE6RK02Dxp7BU0zUMF8FakkT9hnEZaTKbmsM31CtSR6MJmztbIue0ugjV5CKbD/3DwVMIt8rWz521+3xLImIlTZWL+JhFsYxAMTOG5w6di4O23QuEFz1xJnSqJuiuOlQ/ieo5hDnc8yFkpgUIVxABeLD/hhAhKBBGUwtiTldeQmnUrbVZcQCotBIZKp3BQlM/u2ts5UURywbWgtkq1UKKMCFSuSaqvBEq7Iab9EkZN/qVxlJcQyZWAi8BJCUJqymPUca2wr2yoMOXRiJBzIPQL9jAGcQKFiE5EJhRxwI4JcHaVQW5gy0EwTMCLHIm0P9VOBEKW2JXxgIlCxZYejQJ49T+UiThOBXTXKuB3+WG8BjW8SPHuAR0umAZBd3xIZFxTHRBgKXKGxlVntXyw7//g8M+3yBBI9p7K+RCg8/MKJK1CGMlOJK3f0Ua8ELAqb7cxWXMHXWF4yZ0eAwwxyWEBAGjQLF/pZCbHwAAcalVtQlLUqylMhW6Eqmk+v5MJPQOWq8EBSn6ho1D5mr7ctMo/tpZQJ9MPZSkgdb3cZKcoOvnerCe7qhMqS3g0GiwUigOwFTIAOnjNr2pzk0QYo6a6/fsZIjcAVGr3C2GPkpwUw8TU7cKUVJ+GoEcrLM1RwCBzKltMsotu9esO644PBpVm/2BFM6arGZYX4E3AahU6PZNLia+hQMc2qJZRX1MQcuBFEMGN+MyGsYOkcqp+g6oJ/3Xz2oWpQbZvlpi3iP//EdcTDvXydY8HwaQ27yLhX3OsutPvdJYJ6CL42bjmaSMcQQfjSm9rXDxRqG2h8R//KAPNwBEovzsjVOHcT0P1gx6xgGkwymOFB1y3FLCNZtYnO3eQt3FTpQ4C324oBpjc40xSLECyXv8Ckdvxx9BqGthGKae9+O6jAGyo92Imvpfr+s8dDmCamzoGptWOj7XDIgOWGDoc/NmBAeA3MBmZ+2/lNTe6PoIaar1uHRvxp0b2qA+UGE0ywNLzLYC7CtSJQoT9ySBTaXQWIpw/IbeDlEQ7Pco4KKSxn1VQh3dCmN/Qji3xlIuAM4cjDrOzA+b7guSiqMy4QCU4OJ9BgIs7/LevEIMAmsPhKUKv4wJRMSQvK7q3UD3oc4QFKLxssaBSOZffODe8QKgwEaxEsBzc66o0oTEK6QS/STzx2RMEuxhUGZTzkQDweATES4O9GLHAs7zTKawHOIwTyoiDcTwrQaPSWQwM3MDcgZxXWoRZoKFTqr3XMigC5rIJ8IgOibnwgYQz9bSUeIQFyzwT7kL/UJ5/2oHky7AomKN8qgQ6vJwbLZRHFIPiogC86ghturOo2QHk2YBiSoBiuYzEu6BzO4AKzihHDIQmZQB748AoswAutIBI3ZDheLHGOAxZp4UlG4Tj8EBdzURd3kRd70Rd/ERiDURiHkRiL0RiPERmT/1EZl5EZm9EZnxEao1Eap5Eaq9EarxEbs1Ebt5Ebu9EbvxEcw1Ecx5Ecy9EczxEd01Ed15Ed29Ed3xEe41Ee55Ee69Ee7xEf81Ef95Ef+9Ef/xEgA1IgB5IgC9IgDxIhE1IhF5IhG9IhHxIiI1IiJ5Iip2CmQvA9RFGrRGD42OEBZvHQjKo+jCwfMCh9iGwhbuwKQuC5EgwVsYAJNA0LVKkIOCDU+MsDeq5j6CMnE1EfIMsmfdJaajEV9aIYXtIPL3LwoEpwgIXQNDEnJ6ABKksmTXExKijFHs4thkPIKsEDHQEWbekOV+kznMmM9iF2Pq0qL40pGcMSUmym1Cf5/P9BatRykEAhBWnSO0akGyrLiYRMiGgLRcohL01J1NJwD+RgyjQtIQzqoMLAMSsBLgXMEXKqL4EFMJvs95xge5pl0pDSyvaqayRpOKoDbOqA5B6hEaku9JYkWyYA2UbCvWSlEkIiDXgEJcZuDfRC/6hiFYki4JqAIayi6rbAyHRzNzsiG0jy5vYmE66FKgSIqeCrCLSgI6sgG94AsW5T5EjDQagiN9jSCKatU2zTcsDSn44odUTpZDQTNfQooAzhDJDv+FRTDSIgnchTEVUMErYBI6WgMz+DQ/yyBHvzq2hljCynHhZtNByBGmhNxRAD0uzNNx9gmjqxkJAlPFMFDdz/LZUeLTJTxPaQRt3gZTkMRD09jLA6iixF4QyEQaRE7A24rzl4CarESSmyczvRwIS8089QBJF8jC0p7RqOBQ2miQNKK3DGIDsCpwsq5h0q5jyeyhBoKKDUCoFGc1Mi7hb3sgmIlERCCEn9c/BMyye+01bGYWa04HhwEZpSZBLaYcmMIQy6iymkjfe2IAwWrVM2oR56rVr4J6KsoaQYQz12jDRPs2OmjuhECVYOqk1qs6R20lKWa0tXoi5QcDi4hjFkQzxv40/wgAiWgziPQ8iG4w3E0C1sKbRkUjz7RLNiVcN+QyFElWRWtNFw1Klk6UWOwgp1UjM4zZTmxpTewDZ3/6FW77JpFsM0X3F9DGnhjGFJ6HTerG/3fFEpNxNBP5GtKKvJnsGz5GgQMKZPl7KrUq9PUPJLE7Uw8Yc92xPnoGAHa+QatKtRJopECqJNDfQzznPF9mFziME5TkQZFhV8Lg1hOWFzPLURbVUKOg0kkSBI2wbhXgUjkIB6Squ2mIxfPWNmVjMVGlZZNQOH1kfBNlVZ7603QOE6iS82iGkCZM9cnSgt+urLqodWniERMudBHuY/raCBkIJRnaDCeiEvOZW5mCBoTdGJBrYdGk8kaoIUj0dUsyATU1JJRnQavuFCUmUsq6BjHWFRR64dgjRhk0kKUaE/gtUUy3ZaUcQMNv/FCU1pcLKuGzjIrbChw+rzrkRzU4g1cMIBINrUoQLBYZGgeeY0NYUgrArBUnrjcUXMUoQRAa3AFZhBCyrryUIFE3xDIYRCkIgA3taHbAVz1aqScNRVFvQmA6SzUqRAC6oAda32xdbSdNLAN+TAFtTgT2wuYsZ2bUZ2dcBTSFlCVU0WQgBKYNzliOgjBJ3uHwzFTy+DcH7vVZ/ORsWMbbGurlincS8ibDsDF/32OBSIbhlJV+F1dbgtJq7hNS6qG/7uWU0GJT0rAesQWd7IZTKAT+LMXdiIfBmDDvDAKJzAfmMoIOyyRXWjTJ6tO0USt2rSrObPRu/hTS0GRSLVGLz/42QtZTlk9dI0dU+2zTgF53BlBXILk8xIM4WJgzR5rEY384BVVBSmN3kNdv7aAEPYYA8YY4Rth9sa5YRj+Ia/92+IQycsxRk2BRfDt2RHQbC4FVvCJ5nSYhz+LpKoYY3aFVVTAXCWg8ScdFFxAhMCrA1Kh4Sl5BswYh30TxQur4IDB4xTsAtsCegmdHz4coxg4WrTlerKGF5+tkruymS8FIer18f4FgxKYVPOgW+Ocja9bXtsmLOUpRe2J89qOE5j1BgmllaA6lTYR8BeEK4Y2VJkg5Jt1YjDSY8I+Bcv2BI24rSYwf6kyVNf62TWAnr+RFE8wH/mEkDfVSWaJRGI/6y4FspHOs2RaSd1OzkTxuAX8DU9TUYUbIlA81ZcLMhfjCfpaGFJGuttLaEbKgAwfqGc82GvPthyWeJ6z/bInGdznAIr+KZ7VvgXJrlEihYPl6CY3cVi59dGUKMerjdfr+Og4rl9BbqIZalwoDle+QNYdVGX1eMRFoBACEd8TobiwgDe2IZMtfUOdmGEfoMatkUORE0ugcZ3MogaWuqQDdkT4OCkwUOkFWs3BujkfEKDLWFRbwIs2BSmHmTcwgOjnyJJN4EaMEEoB1klQvRMDTZUdlgh3BlREAW14KGkAxRv7NkLwphZ8zn1BLnUWqdqNPkZDvdV10gZmBShrmyQUv/CKzd5lypurDeJ0gZBKCCT0XrR6x7WLRthRoJFEqqZi7AlC3DWRzbRkvVBDiJ2W/yXZsmpwTSpIGakjxD5kLtBk1WXBBr7VpGlPv4oPNLhT0JiDxpBfsTGhwfMOhjifu9BPO+6l7NLnos3Zao6Z2nWSOqZYfbjiSsZmN06W0CXLSm5oA35k9dghxvYrXF7fdjinFWvZxn6QZpnp6mln0Z3F/saGFAO+MLnI+42U/SMXJoTSCx5R0kFUFY2EMmSONsFxgZvFqhnVFdW+wzkVdnSM+HbWthbJWssuf7qC4LYUuguD5wpu0xJT/xFofBgETzrdsa5H2I79WY75WR13qj/WsC802GNO4I//KIk2asTDKydd2bh4J6api6Ke5MvgWCVxLYGGuEOd8PTwNdaxcM1gxliYZUZx8PFxps522U1lGjFqdN0UlKgJBmiRhEu1pslW+rEI3z7bW3FWqHuTG/l11UOoAc9zUHW6n7DxJlVQiq0lwmq/MTnZ6/h4J+RQGw0e34yQLapRKFiF6TEA4b3gcIDD2Wrl6o/48+Jt8P1hm8om0UVrlqhp+JMPDwNJH5HQd4UuT09nKAPN6AHnS3k4NB7/Ipz+0YFQql7MQTKyozboM0plF0qmAgeK2Aq6DTEQjWuoVCO8zRsLrgRocmtnCUAo0274VqdXKIyodOE/+C8U+pyQsx2fNKO9rlG8XZ95Pco0ETeWGa1S5NKhGL84EVmKnfCu9czBPrP63W93OVA/i7H+WYMdJKr20rRG+rq4ADbx9O8svnsqLdpiFLSAYamyr3dqc6+N6nHNeIrfUVDzETVc9HzGiDXuHczbVb5dFVfGUEbcjza5n3L38DW6/qPMyHrjqJFbEkguDt6L0xmUv0Tdo1mOzgnOaGvLF4JnEmTR+Qo1nZDUN78tPylaTyQqcS34cUQoqvbVcKmqnDnF2O9AH3cM2AC3kBUOQBEPAsrzn1cDAF6Gyqc43rRvUQUAGjAyatXGoQt46BNoZ573U1JStfFWW7p89XpUf886vUGyG+ux49VxQj+4Zt8F8srSE6cSjcw+94LXOXgExKBYDhmQEdB24b2P2ni1n1ZJTz725aE3CRYSvqMuN4gEV77VVuvaWRzNoCV8TU+FX5Q+2aeJYqOZoX+xV8FtZ5B05sTQXE+HyicPiLJti2Kqkkg1Al4XuyA8Ps9dVFjC6ovxOfot/XZJYpzATeEzgztpX1dCLohonv4KAj6IeT97uag98OGE3KcC+Weums0rboeDiqjZWErl5j93d0uW+iHSjYCP26BGDiC4tvQMlMj49W/DcMsAtel09cMCA7CCqloPE4OmWNjEjqSkkQo9SjyFC1CjvFzWFAzwo9Ra6H/cg6R4kYNrRwe0FDiwIV6DufiQ+j//2EVeTUYhcRBiblVMbaBMeLpkWR49AFeHhwlFOaddRYhXj19kuTJkfRNHhDB3ZFoCVp5kBWlHUzU3T6VxvIdxCIewRr1xS4cbJQdNOTuGYkcP9DdUpGyCU0c7zJ6WHh/eyc9gJMbmfqqstop9xbVbZMcJGRJHgkxDpOEYIk0CIkYaVCIxIdjywBCSqhwIcOGDheaURixi5AEDx4YRAblQ64GlhLQ0kev3aA+CZJV6bOkVDB89aC00ajM2cwiUqhYyIUNnqYDPKmIqBOyyoduEx7kIhGzZZ41R2KipEdTapEIMq8lQHhETAKe/9ZSEcvEzgiclSxPXZNHreFNhnmO6ukzgRy4e4NWsfS0ykMatEVIWRUE9hi0A1rzQVI0gYSInDtT/jLScmRYQYcMB/TTYCjBOgsAclxr7uUggw20VtGCafUfI4HRkSBMeOzTySKCaRlXV6yHbuGOZcxkVYizZUWOVbC6+CHz5s6f4ySdWroHf3+cELUkJMLPV5GPfEiyjPPorH+X9U6v3kOSqVGERKU35UhZxu+eZTD9QbUaV9cGJuQIFSFUgNElDURgQUwcHLPHRDbBB4UW85GlBGP/FNHYGAT1xoE3cBh3xFdiwUaZPvddgxZUecSBGiT+kMeILV98UAwkdr3Hxf8neYBInSSHoAUWBx60sZyJVXBgSQRaNZYLdkfYCIpf3sUSZRpOsURcGJ6FFJNZec2hXQITcOCiQtYwAmRYtRApGpVQHBNfX/SsVoR1gHg0TnLjbejFYjzaSSJ0gxJaqDCsXeIeY73FCMUVHphJWwgZWHdSQn04wyKiWnZhXXy1yLOBehsIRQIcy3GAS0VmhSDedhZAGicqm2Iihx8LjMNBSCAmw6IFIkT5gadohDpqqW0AGBStnILqDKbfNPhNlMp9UIEFFdRxhgjiocRBHQl8WcVtjzBkSQUARZnhaGIF9UgIsOblTbjenRHCA7H48wyKR3ZRgUEJKNrkEFr1kaf/SRchfIzBdQhSX0ALcFaJEKdJGOF5zoS3XcaazaXrPuupJ8YEIKv3gb34kqgsPIh5B8YGQ3LgzxRajKyeXRtQ4sET+fRzkKnLvGuhF2tAM4+hRyPdnBa4Itx0wtIlzU5hQiywQaRGpGHeeQvQBQ6mGYqXAEmBYvKnECGERvWvA6pKHByPFOi03HITIaqZwFqs1B/zbFvR2CTcCchyVn0Jx0UJKtjbLooQeVEdUWmHKBZcPbH3FceABJ5BWCKJV0MZiF0ZEoA4lcanYB7BtCWxbHCRP+RaReGbg0Sg05jdGRK2YMvM3TtS3/kDzweoteqHoiQoN5oF1VZqlggZRG4H/3/L1sqG61+45jltWXLR49lU2SPooVhM8wBCPfuxiz8NIBe1++9Pd3xN8I9lQQMVNEpFBP6dA8mDVi0pQHS5Qz9WAsDTOWoDEZBDP/5mKFxEzCoLEAQAr8aGARqBUrhLSIKy5LMSTQcLXkBJBuQFEHHcDQ75845/FoKadCmlaefKYBXQNKuK0ERTmzHCBig2PiYI4QFWa0glAATDhUQpRJAojDSWmEM9eOELGbhaNyqwmI+RLIsgo4UOu+TD7fWjdAiLAOuECIWLuEQQE5Ad3rTXtwTIjn5yPNo+NliEOs5RH5ByjouusEI8ZsiBDWGSBRNSSEMdMpB5VMij2lGUhP/sAyGCbKGjFLIB+S1yUXZ0iJkiCZ4y8ZGO8FLIB1ZYhXdhQVeZ5OSA9miIRDLHkwkp5Spractb4jKXutwlL3vpy18CM5jCHCYxi2nMYyIzmcpcJjOb6cxnQjOa0pwmNatpzWtiM5va3CY3u+nNb4IznOIcJznLac5zojOd6lwnO9vpznfCM57ynCc962nPe+Izn/rcJz/76c9/AjSgAh0oQQtq0IMiNKEKXShDG+rQh0I0ohKdKEUratGLYjSjGt0oRzvq0Y+CNKQiHSlJS2rSk6I0pSpdKUtb6tKXwjSmMp0pTWtq05viNKc63SlPe+rTnwI1qEIdKlGLatSjIjUTqUpdKlOb6tSnQjWqUp0qVZkZBAAh+QQFFAAlACxGAWMBOwALAAAGpkASZkgskkiBACC5VAaOhqh0emRYr9ijZMvtCovgY3OcfJIKBrQ6bahi39qu/AsmHp34JQC67rvfV3FyXHR1GCQjTE56ZlOObSSAWSSDXoZ2SIxkfGx+kZJWgpWFdWKKeGZ9nZCgoZSVW6RhmWWaUI9Sf5Kig7JGSIu1qatruoC8c5dDd5p4IyTEncZwr7C+mGTBt7isrcheR+Hi4+Tkz4hH5+Xr60EAIfkEBRQAJQAsRwFjAToACwAABqJAiXBIJJEwyKTSGAgAmk9nwGioWq9GhnbLJXolRqUYY4yam1NSwbBusw1ZrvxbPI6TzLMUQHX743JbdENhd0gkI1B7UlRXjoCBDINChYZ5i4wkb35skIGTYHaWJHpRaZxunnOTlXeXik98mo5YJJGCrKKuJLBoT0aob6pduYaHvLGYI5rBBcO4g61jZYqLjbRVz1pG3N3e3+Dh3MuIRuTiRkEAIfkEBRQAJQAsRwFjAToACwAABqFAhnBIJJEkyKTSiGk6n8ZAACClTgNGg3bLJXoZRqVYwnyajda0FEsqGNzwt+FbPI6TZbMzqr4CsnGBdENhd0h5ehgkI1V+V1lckYNChYaIenyOjyRygW+TYHaWJIl7JH1WbJ5xoJV3l2ckV41Uf5yRXZOuY7BQspqbq3Ktoq+kpYqytZojnMIFxIaHx6VojY6QuFpG3N3e3+Dh4t/Ni0bNQQAh+QQFFAAlACxHAWMBOwALAAAGp0CDcEgkkRjIpNIoaTqfRox0SjUGAoBrFhsgFQzfMNhgVJoZzKc6Sm0bt/BrdywOl8/JtNrJbk+tcVwAJESFZEd4SHp7En1+GCQjWoJchHV0d4mLe45+gJSVl2KZeJtrJI9/JIFbc4ZDpGemUKipkCRck1mDomOxZrN8talWoJV0yAW/SySMwra3lLtXI6+wiJrNzo3Dj2+TlEaRRiPk4ufo6err7OtBADs="); 
                                                background-size: contain; 
                                                background-repeat: no-repeat; 
                                                background-position: center;   
                                                display:flex; 
                                                align-items: center;   
                                                position: absolute; 
                                                top: 0px; 
                                                left: 0px; 
                                                width: 100%;
                                                z-index: 999;
                                }
                                #play_icon img {  
                                                width:10%; 
                                                margin-left: 45%;
                                } 
                </style>
                <script>
                        var url = '<?php echo($_REQUEST['url']);?>';
                        var url = '<?php echo($_REQUEST['url']);?>';
                        var nostorage = '<?php echo($_REQUEST['nostorage']);?>';
                        var isWap = navigator.userAgent.match(/iPad|iPhone|iPod|Baidu/i) != null; //百度浏览器和苹果移动端不使用P2P功能
                        var isMobile = !!navigator.userAgent.match(/AppleWebKit.*Mobile.*/); //是否手机端
                        if(!isWap){
                                if(url.indexOf(".m3u8") > 0){          
                                                var _peerId = '', _peerNum = 0, _totalP2PDownloaded = 0, _totalP2PUploaded = 0;        
                                                var type = 'customHls';
                                }
                                else {
                                                var type = 'normal'; //MP4格式P2P兼容性不好，不调用P2P。
                                }
                                var dp = new DPlayer({
                                        container: document.getElementById('dplayer'),
                                        autoplay: false,
                                        hotkey: true,  // 移动端全屏时向右划动快进，向左划动快退。
                                        airplay: true,
                                        logo: '',
                                        video: {
                                                url:url,
                                                pic: '',  //图片地址。
                                                type: type,
                                                customType: {
                                                        'customHls': function (video, player) {
                                                                const hls = new Hls({
                                                                        debug: false,
                                                                        p2pConfig: {
                                                                                logLevel: true,
                                                                                live: false,        // 如果是直播设为true
                                                                        }
                                                                });
                                                                hls.loadSource(video.src);
                                                                hls.attachMedia(video);
                                                                hls.p2pEngine.on('stats', function (stats) {
                                                                        _totalP2PDownloaded = stats.totalP2PDownloaded;
                                                                        _totalP2PUploaded = stats.totalP2PUploaded;
                                                                        //updateStats();
                                                                }).on('peerId', function (peerId) {
                                                                        _peerId = peerId;
                                                                }).on('peers', function (peers) {
                                                                        _peerNum = peers.length;
                                                                        //updateStats();
                                                                });
 
                                                        }
                                                }
                                        },                        
                                        /*danmaku: {
                                                id: 'E3368B56CDBB4IU',   //弹幕代码，可定义其他的ID，请修改；
                                                api: 'https://dplayer.moerats.com/',
                                                bottom: '25%',
                                                unlimited: false,
                                        }, */            
                                        contextmenu: [
                                        ],
                                        highlight: [
                                                {
                                                        text: '提示：点击下方状态栏可以发送字幕',
                                                        time: 360,
                                                },
                                                {
                                                        text: '警告：请不要相信视频中任何广告与字幕',
                                                        time: 1200,
                                                },
                                        ],
                                });
                                  
                                var webdata = {
                                        set:function(key,val){
                                                window.sessionStorage.setItem(key,val);
                                        },
                                        get:function(key){
                                                return window.sessionStorage.getItem(key);
                                        },
                                        del:function(key){
                                                window.sessionStorage.removeItem(key);
                                        },
                                        clear:function(key){
                                                window.sessionStorage.clear();
                                        }
                                };
                                if (!nostorage)  {
                                        dp.seek(webdata.get('vod'+url));
                                        setInterval(function(){
                                                        webdata.set('vod'+url,dp.video.currentTime);
                                        },1000);
                                }
                                dp.on('ended',function() {
                                        dp.notice("视频播放已结束");                   //可以替换成下一集调用等代码
                                        if(parent.MacPlayer.PlayLinkNext!=''){
                                                top.location.href = parent.MacPlayer.PlayLinkNext;
                                        }
                                });
                                 
                                if (isMobile) {
                                        //全屏事件
                                        dp.on('fullscreen',function() {
                                                screen.orientation.lock("landscape");
                                        });
                                        //退出全屏事件
                                        dp.on('fullscreen_cancel',function() {
                                                screen.orientation.unlock();
                                        });
                                         
                                        //左右滑动快进、后退
                                        let touchPointX = 0;
                                        let touchPointY = 0;
                                        let currentTime = 0;
                                        let isSeeked = false;
                                        document.addEventListener('touchstart', e => {
                                                let touch = e.touches[0];
                                                touchPointX = touch.clientX; // 获取触摸的初始位置
                                                touchPointY = touch.clientY;
                                                currentTime = dp.video.currentTime; // 获得当前播放时间
                                        });        
                                        document.addEventListener('touchmove', e => {
                                                let touch = e.touches[0];
                                                let diffX = touch.clientX - touchPointX; // 通过当前位置与初始位置之差计算改变的距离
                                                let diffY = touch.clientY - touchPointY;
                                                let totalTime = dp.video.duration;
                                                if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 5) {
                                                        let seekTime = parseInt(currentTime + diffX); // 计算出快进时间
                                                        if (seekTime < 0) {
                                                                seekTime = 0;
                                                        }
                                                        if (seekTime > totalTime) {
                                                                seekTime = totalTime;
                                                        }
                                                        dp.seek(seekTime);
                                                        isSeeked = true;
                                                }
                                                let notice = document.getElementsByClassName("dplayer-notice");
                                                if (notice.length > 0) {
                                                        notice[0].style.display = "none";
                                                }
                                        });
                                        document.addEventListener('touchend', e => {
                                                if (isSeeked) {
                                                        let touch = e.changedTouches[0];
                                                        let diffX = touch.clientX - touchPointX;
                                                        let notice = document.getElementsByClassName("dplayer-notice");
                                                        if (notice.length > 0) {
                                                                notice[0].style.display = "block";
                                                        }
                                                        dp.notice((diffX>0?"快进":"快退") + parseInt(Math.abs(diffX)) + "秒", 2000);
                                                }
                                                isSeeked = false;
                                        });        
                                }
                        }
                        else{
                                document.getElementById('dplayer').innerHTML='<video src="'+url+'" controls="controls" preload="preload" poster="" width="100%" height="100%"></video>';
                        }
                        function updateStats() {
                                var text = '七星P2P正在为您加速' + (_totalP2PDownloaded/1024).toFixed(2)
                                                + 'MB 已分享' + (_totalP2PUploaded/1024).toFixed(2) + 'MB' + ' 连接节点' + _peerNum + '个';
                                document.getElementById('stats').innerText = text ;
                        }
                </script>
                <script>
                        var video = document.getElementsByTagName('video')[0];
                        //添加引导点击播放图片
                        var img = new Image();
                        img.src="data:image/png;base64,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";
                        document.getElementById("play_icon").appendChild(img);
                        video.setAttribute("playsinline", "true");
                        video.setAttribute("webkit-playsinline", "true");
                        video.setAttribute("x5-video-player-type", "h5");
                        video.setAttribute("x5-video-player-fullscreen", "false");
                        var state = 0;
                        video.onplaying = function(){
                                var icon = document.getElementById("play_icon"); 
                                if (icon) {
                                        icon.remove()
                                }
                                state=1; 
                        };
                        video.onplay = function(){
                                var icon = document.getElementById("play_icon"); 
                                if (icon) {
                                        icon.remove()
                                }
                                state=1; 
                        };
                        video.onpause = function(){
                                state = 0;
                        };
                        var playIcon = document.getElementById("play_icon");
                        if (playIcon.addEventListener) {
                                playIcon.addEventListener('click', function(){    
                                        if(state==0){        
                                                video.play();  
                                        }else {
                                                video.pause(); 
                                        }
                                }, false);
                        }
                         
                        document.addEventListener('dblclick', function(){    
                                if(state==0){        
                                        video.play();  
                                }else {
                                        video.pause(); 
                                }
                        }, false);
                        document.addEventListener("WeixinJSBridgeReady", function () {    
                                        video.play();
                        }, false);
                         
                        //把设置按钮改为速播
                        var settingIcon = document.getElementsByClassName("dplayer-setting-icon")[0];
                        settingIcon.innerHTML="倍速";
                        settingIcon.style.outline="none";
                        settingIcon.style.color="white";
                        settingIcon.style.padding="0 5px";
                        var speedIcon = document.getElementsByClassName("dplayer-setting-speed")[0];
                        settingIcon.onclick = function(){
                                speedIcon.click();
                                //速度选择框为横向显示
                                document.getElementsByClassName("dplayer-setting-box-speed")[0].style.width = "300px";
                                var speendItems = document.getElementsByClassName("dplayer-setting-speed-item");
                                for (let i=0; i<speendItems.length; i++) {
                                        speendItems[i].style.display = "inline";
                                }
                        };
                         
                        //去掉页面全屏按钮
                        document.getElementsByClassName("dplayer-full-in-icon")[0].remove();
                </script>
        </body>
</html>