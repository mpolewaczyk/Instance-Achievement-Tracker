if(GetLocale() ~= 'esES' and GetLocale() ~= 'esMX') then return end

local _, core = ...
local baseLocale = {
	["- Announce to chat players who are missing achievements for certain bosses"] = "- Informar por chat a los jugadores que no tengan los logros de ciertos bosses",
	["- Announce to chat tactics for a certain boss"] = "- Informar por chat a los jugadores la mecánica del logro de un boss",
	["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Realiza el seguimiento de los logros que requieran matar varios bichos en un tiempo determinado. Se anunciará por chat cuando hayan aparecido los bichos suficientes y si se mataron en el tiempo requerido.",
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Escanea a todos los jugadores del grupo para ver qué logros les falta a cada uno para la mazmorra actual",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Realiza un seguimiento cuando el requisito de los logros de la mazmorra ha sido fallado y lo envía al chat",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Realiza un seguimiento cuando el requisito de los logros de la mazmorra ha sido conseguido y lo envía al chat",
	["(Enter instance to start scanning)"] = "(Entra en la mazmorra para comenzar a escanear)",
	["Atal_Dazar_Yazma"] = "Para encender los Apliques de Pirosombra, todo el grupo excepto el tanque tendrán que repartirse y quedarse cerca de un aplique  cuando el boss lance %s. Los apliques permanecerán encendidos durante 25 segundos, por lo que esto se tendrá que hacer cuando al boss le quede alrededor de un 5 o 10%% de vida.",
	["AtalDazar_Other"] = "La IAT_122969 lanza %s a lo largo de la mazmorra en un jugador aleatorio que es maldecido durante 5 segundos y que al final de la duración cualquiera que esté cerca de ese jugador también será maldecido. \n\nAntes de pullear cualquier IAT_122969 se tendrá que haber limpiado la mazmorra de bichos y entonces se podrá pullear y llevarla a todos los jefes. Si se tiene una clase con un largo control de masas (como el Monje con %s, Cazador con %s, Mago con %s) se la podrá tener controlada hasta cerca del final del combate. Si no se tiene ninguna clase con control de masas, habrá que enfocarse en interrumpir el lanzamiento de su %s hasta cerca del final del combate.",
	["AtalDazar_Priestess_AlunZa"] = "El boss irá invocando un add cuando lance %s. Este add se moverá a cualquier charco de %s y lo absorberá. Cuando no queden charcos atacará a los jugadores por lo que habrá que controlarlo para evitar un daño excesivo. El add tendrá que absorber 8 charcos de %s para convertirse en una IAT_131140.",
	["BattleOfDazaralor_ChampionOfTheLight_Alliance"] = "Para este logro hará falta robar 3 alhajas de cada uno de los enemigos del encuentro, y llevarlas a la Misteriosa Pila de Basura. Habrá que robar 9 alhajas en total: 3 de %s, 3 de %s y 3 de %s\n\n Este logro requiere que todo el mundo de la banda interactue con la Misteriosa Pila de Basura para obtener el debuff %s. Durante el combate contra el boss los jugadores se transformarán en %s y obtendrán un botón extra de acción para usar en los enemigos para robarles las monedas brillantes.\n\n Una vez el grupo de banda haya entregado 9 monedas brillantes (3 de cada tipo de NPC) se podrá matar el boss y conseguir el logro.",
	["BattleOfDazaralor_ChampionOfTheLight_Horde"] = "Para este logro hará falta robar 3 alhajas de cada uno de los enemigos del encuentro, y llevarlas a la Misteriosa Pila de Basura. Habrá que robar 9 alhajas en total: 3 de %s, 3 de %s y 3 de %s\n\n Este logro requiere que todo el mundo de la banda interactue con la Misteriosa Pila de Basura para obtener el debuff %s. Durante el combate contra el boss los jugadores se transformarán en %s y obtendrán un botón extra de acción para usar en los enemigos para robarles las monedas brillantes.\n\n Una vez el grupo de banda haya entregado 9 monedas brillantes (3 de cada tipo de NPC) se podrá matar el boss y conseguir el logro.",
	["BattleOfDazaralor_ConclaveOfTheChosen"] = "Para obtener este logro hará falta dejar vivo a al menos uno de los primeros raptores invocados por Gonk durante el resto del combate. El resto se pueden matar y al vivo, como no se le puede hacer control de masas, hará falta pasearlo durante todo el resto del combate.\n\n Cada 20 segundos el %s fijará a un jugador diferente (%s), por lo que habrá que asegurarse que los jugadores paseen al add lejos de la raid para esquivar el daño de aŕea.\n\n Uno o dos DK pueden ser útiles en este combate ya que pueden apartar el raptor de la raid con %s.",
	["BattleOfDazaralor_Grong_Alliance"] = "Para este logro hará falta transportar y colocar 6 barriles en el suelo antes de que comience el combate contra %s. Se pueden encontrar los %s junto al comienzo de las escaleras que llevan a la sala del boss.\n\n Se han de colocar los %s en el suelo, pullear el boss, y asegurarse de que los barriles son golpeados por %s.\n\n Una vez se destruyan los %s, el boss ganará un buff de 30 segundos de 20% de daño incrementado por cada barril destruido (%s). Una vez sean destruidos todos los barriles, ya se puede matar el boss y obtener el logro.",
	["BattleOfDazaralor_Grong_Horde"] = "Para este logro hará falta transportar y colocar 6 barriles en el suelo antes de que comience el combate contra %s. Se pueden encontrar los %s junto al comienzo de las escaleras que llevan a la sala del boss.\n\n Se han de colocar los %s en el suelo, pullear el boss, y asegurarse de que los barriles son golpeados por %s.\n\n Una vez se destruyan los %s, el boss ganará un buff de 30 segundos de 20% de daño incrementado por cada barril destruido (%s). Una vez sean destruidos todos los barriles, ya se puede matar el boss y obtener el logro.",
	["BattleOfDazaralor_HighTinkerMekkatorque"] = "Para completar este logro se necesitará un ingeniero con %s y %s.\n\n Hay que invocar los dos Joyatrones antes de comenzar el encuentro (se comenzarán a pelear los Joyatrones). Poco después de haber pulleado el boss, aparecerá el %s. Es fácil de matar, así que una vez muerto se hace lo mismo con el boss y se obtendrá el logro.\n\n %s tiene dos habilidades:\n %s - Un ataque melé de 8 metros de distancia, así que si se está cuerpo a cuerpo hay que alejarse.\n %s - Cadena de Relámpagos, habrá que separarse o interrumpir la habilidad.",
	["BattleOfDazaralor_JadefireMasters"] = "Para este logro se tendrá que recoger el %s que se haya escondido en la sala del boss, protegerlo del daño de fuego y hacer que la Monje lance %s en el huevo.\n\n Habrá que coger el huevo después de que hayan muerto el primer par de %s, así no hay riesgo de perderlo debido a %s. Hay que asegurarse de coger el huevo antes de que empiece la Fase 2, ya que el %s lo romperá. \n\n La Monje se transformará en un %s al 100 de energía. Después de que %s impacte al jugador que lleva el huevo, se podrá matar el boss y conseguir el logro.\n\n La localización del %s es diferente para la Horda y la Alianza.",
	["BattleOfDazaralor_JainaProudmoore"] = "Para completar este logro harán falta 3 jugadores para recoger montones de nieve durante el combate contra %s.\n\n Los montones de nieve sólo se pueden encontrar en la primera interfase. Los montones de nieve se distribuirán alrededor del área circular de combate así que harán falta al menos 3 personas de movimiento rápido para correr tan pronto empiece la interfase.\n\n Habrá que caminar por encima de los montones de nieve lo que hará aparecer  un pequeño copo de nieve junto a los personajes. Una vez recogidos los 3, habrá que interrumpir al boss para pasar a fase 2. Los jugadores con los copos de nieve tendrán que juntarse cerca de uno de los barriles para crear el %s.\n\n Habrá que usar la %s para quitar el %s del barril junto al %s y entonces atacar el barril. La explosión causará que el %s se derrita, lo que completará los requisitos para este logro.",
	["BattleOfDazaralor_KingRastakhan"] = "Para hacer este logro sólo hay que dejar vivos los adds Fantasmas hasta el final del combate. Sólo hay que tanquearlos lejos de la raid para esquivar daño innecesario.\n\n Un tercer tanque es ideal para este logro.",
	["BattleOfDazaralor_Opulence"] = "Para conseguir este logro primero hay que asegurarse de que algún jugador tiene la mascota %s.\n\n El logro es personal y requiere que el jugador haga /alabar en la mascota %s mientras se está bajo el efecto de %s. No hace falta que cada uno tenga su mascota.\n\n Para estar bajo el efecto de %s, uno o más jugadores tendrán que coger el %s. Esta joya le garantiza al jugador una acumulación de %s mientras no tenga a nadie alrededor. Cuando se alcanzan las 100 acumulaciones se ganará el aura %s durante 20 segundos, lo que garantiza al jugador y a los que le rodeen %s lo que incrementa la probabilidad de golpe crítico un 100%%. El buff tardará 100 segundos en aparecer (1 acumulación por segundo) y una vez esté activo hay que hacer /alabar a la mascota %s para cumplir los requisitos del logro, tras lo cual ya se podrá matar al boss.",
	["BattleOfDazaralor_StormwallBlockade"] = "Para completar este logro hara falta invocar a la %s durante el combate contra el boss. No hay que matar a la %s.\n\n Para invocar a la %s es necesario hacer click en un banco de pesca a la izquierda del muelle, que aparece tras iniciar el boss. Ese jugador tendrá que lidiar con algunas mecánicas durante 2 minutos.\n\n -Tras clickar en el banco de pesca, el jugador comenzará a tirar de una cuerda para sacarla del agua y, al mismo tiempo, será arrastrado intentando echarlo al agua. Camina en dirección opuesta para permanecer en el muelle, pero no te alejes demasiado del borde o la cuerda se romperá.\n - Poco después, %s comenzará a caer sobre el jugador, quien tendrá que esquivarlos para permanecer vivo.\n Después de eso, las olas comenzarán a romper en el muelle y el jugador que está arrastrando la cuerda tendrá que esquivarlas.\n\n Todo eso sucederá durante los 2 minutos en los que se está arrastrando la cuerda. El resto de la banda tendrá que estar haciendo el boss de la manera habitual.\n\n Una vez haya aparecido la %s, el jugador que invocaba y después el resto de la banda tendrán que hacer frente a dos habilidades junto a las propias del boss:\n %s - Un cono frontal que empujará al agua a cualquiera que sea alcanzado. \n %s - Atrae a todos los jugadores hacia la %s, matando instantáneamente a cualquiera que se le acerque demasiado.\n\n Para lidiar con la %s, hará falta un jugador (idealmente un pícaro forajido) que se centre únicamente en aturdirla cada vez que lance %s. Si no se tiene un pícaro, se puede hacer una rotación de aturdimientos. El resto de la banda tendrá que matar al boss antes de llegar al enfurecimiento mientras lidian con %s como mecánica prioritaria.",
	["BattleOfDazzarlor_BarrelsDestroyed"] = "barriles destruidos",
	["Core_AchievementScanFinished"] = "Escaneo de Logros Acabado",
	["Core_AchievementTrackingEnabledFor"] = "Escaneo de Logros Activado para",
	["Core_CommandEnableTracking"] = "activar/desactivar IAT escaneo de logros",
	["Core_Commands"] = "Lista de comandos de texto",
	["Core_Counter"] = "Contrarresta",
	["Core_CriteriaMet"] = "Requerimiento conseguido. ¡Puedes matar al Boss!",
	["Core_Enable"] = "activar",
	["Core_EnableAchievementTracking"] = "¿Quieres activar el seguimiento de logros para",
	["Core_Failed"] = "¡FALLADO!",
	["Core_GameFreezeWarning"] = "Esto puede congelar el juego unos segundos",
	["Core_help"] = "ayuda",
	["Core_ListCommands"] = "muestra una lista de comandos de texto disponibles",
	["Core_No"] = "No",
	["Core_NoTrackingForInstance"] = "IAT no puede rastrear ningún logro para este encuentro",
	["Core_PersonalAchievement"] = "Logro Personal",
	["Core_Reason"] = "Razón",
	["Core_StartingAchievementScan"] = "Comenzando exploración de logro para",
	["Core_TrackAchievements"] = "Seguimiento de Logros",
	["Core_Yes"] = "Sí",
	["Features"] = "Características",
	["Freehold_HarlanSweete"] = "%s targeteará a un jugador aleatorio para %s, el cual se deberá posicionar cerca de uno de los cofres para que sean destruidos.",
	["Freehold_RingOfBooty"] = "Para este logro se deberán recoger 3 objetos a lo largo de la mazmorra. %s aparece en el nido que hay junto al primer boss una vez sea éste derrotado. %s se encuentra encima de un barril en la parte superior de la plataforma en El Barrio del Ron (después del primer puente largo). %s se encuentra junto a Cazatiburones después del tercer boss (por la parte del público de la derecha).",
	["Freehold_SkycapNKragg"] = "Para invocar a IAT_138314 se tendrá que colocar un %s antes de pullear al jefe.",
	["GUI_Achievement"] = "Logro",
	["GUI_Achievements"] = "Logros",
	["GUI_AchievementsCompletedForInstance"] = "Todos los logros han sido completados para",
	["GUI_AchievementsDiscordDescription"] = "Puedes contribuir amablemente con tácticas a través del Servidor de Discord, la comunidad donde los miembros pueden reunirse con coleccionistas de logros y formar grupos para una variedad de ellos.",
	["GUI_AchievementsDiscordTitle"] = "Discord de Logros",
	["GUI_AnnounceMessagesToRaidWarning"] = "Anunciar mensajes como Aviso de Banda",
	["GUI_AnnounceTracking"] = "Anunciar qué logros están siendo rastreados para el grupo",
	["GUI_Author"] = "Autor",
	["GUI_BattleForAzeroth"] = "Battle for Azeroth",
	["GUI_Cataclysm"] = "Cataclismo",
	["GUI_Disabled"] = "Desactivado",
	["GUI_EnableAddon"] = "Activar Addon",
	["GUI_EnableAutomaticCombatLogging"] = "Activar el registro automático del combate",
	["GUI_Enabled"] = "Activado",
	["GUI_EnterInstanceToStartScanning"] = "Entra en la mazmorra para comenzar a escanear",
	["GUI_GreyOutCompletedAchievements"] = "Ensombrece los logros completados",
	["GUI_HideCompletedAchievements"] = "Oculta los logros completados",
	["GUI_Legion"] = "Legión",
	["GUI_MinimapDisabled"] = "Icono de minimapa desactivado",
	["GUI_MinimapEnabled"] = "Icono de minimapa activado",
	["GUI_MistsOfPandaria"] = "Mists of Pandaria",
	["GUI_NoPlayersNeedAchievement"] = "Ningún jugador del grupo necesita este logro",
	["GUI_OnlyDisplayMissingAchievements"] = "Muestra sólo los logros que faltan",
	["GUI_OnlyTrackMissingAchievements"] = "Rastrea sólo los logros faltantes",
	["GUI_Options"] = "Opciones",
	["GUI_OutputPlayers"] = "Mostrar Jugadores",
	["GUI_OutputTactics"] = "Mostrar Táctica",
	["GUI_Players"] = "Jugadores",
	["GUI_PlayersWhoNeedAchievement"] = "Jugadores que necesitan ese Logro",
	["GUI_PlaySoundOnFailed"] = "Reproduce un sonido cuando un logro falle",
	["GUI_PlaySoundOnSuccess"] = "Reproduce un sonido cuando un logro se complete",
	["GUI_ScanInProgress"] = "escaneo todavía en proceso",
	["GUI_SelectSound"] = "Selecciona Sonido",
	["GUI_Tactics"] = "Tácticas",
	["GUI_ToggleMinimap"] = "Muestra el Botón del Minimapa",
	["GUI_Track"] = "Seguir",
	["GUI_Tracking"] = "Seguimiento",
	["GUI_TrackingDisabled"] = "(Seguimiento de Logros Desactivado)",
	["GUI_TrackingNumber"] = "Realizando Seguimiento",
	["Gui_TranslatorNames"] = "(EU) Krovikan-Minahonda",
	["GUI_Translators"] = "Traductores",
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	["Instance Achievement Tracker"] = "Seguimiento de Logros de la Mazmorra",
	["Instances_Other"] = "Otros",
	["Instances_TrashAfterThirdBoss"] = "Pulls después del tercer boss",
	["KingsRest_DazarTheFirstKing"] = "Este logro se consigue en %s, el último boss de la mazmorra. Se han de colocar dos jugadores encima de la piedra que hay enfrente de los dos sarcófagos (cada uno en una piedra) y esperar a que las luces acaben de rodear el borde de la piedra. Una vez estén ambas encendidas, el sarcófago de la de la derecha comenzará a temblar lo cual significa que ya se puede matar al boss.",
	["KingsRest_MchimbaTheEmbalmer"] = "Para este logro hay que liberar al jugador targeteado por %s usando una sola vez como máximo %s. Se ha de  liberar antes de que el boss acabe de lanzar %s.\n\n Nota: Los jugadores han reportado un pequeño fallo en este logro, por lo que es recomendado que el jugador confinado no use %s antes de que el boss lance %s.",
	["KingsRest_Other"] = "El primer abalorio está en la primera sala de la mazmorra, detrás del sarcófago y debajo de las cestas.\n El segundo abalorio está justo antes del primer pasillo hacia el primer boss, al final de la plataforma y detrás del segudo conjunto de escaleras.\n El tercer abalorio - (comprueba antes la Guía del logro Gloria del Héroe de Guerra en Wowhead)\n El cuarto abalorio está justo antes de la sala del boss final, al final de las escaleras, encima de la parte superior del pilar de la derecha (para cogerlo hacer click mientras se salta).",
	["Main"] = "Menú Principal",
	["Shared_AddKillCounter"] = "%s contador de muertes",
	["Shared_CompletedBossKill"] = "se completará cuando el boss muera",
	["Shared_DamageFromAbility"] = "%s Daño",
	["Shared_DirectHitFromAbility"] = "%s Golpe Directo",
	["Shared_DoesNotMeetCritera"] = "no cumple los requisitos para",
	["Shared_Eight"] = "8",
	["Shared_Eighteen"] = "18",
	["Shared_Eleven"] = "11",
	["Shared_FailedPersonalAchievement"] = "%s se ha fallado %s (Razón: %s)(Logro Personal)",
	["Shared_Fifteen"] = "15",
	["Shared_Five"] = "5",
	["Shared_Found"] = "encontrado",
	["Shared_Four"] = "4",
	["Shared_Fourteen"] = "14",
	["Shared_GotHit"] = "golpe recibido",
	["Shared_HasBeenHitWith"] = "ha sido golpeado con",
	["Shared_HasBeenInfectedWith"] = "ha sido infectado con",
	["Shared_HasCompleted"] = "se ha completado",
	["Shared_HasFailed"] = "ha sido fallado",
	["Shared_HasGained"] = "ha sido ganado",
	["Shared_HasLost"] = "ha sido perdido",
	["Shared_HeCanNowBeKileld"] = "Ya se puede matar",
	["Shared_JustKillBoss"] = "A nivel máximo, simplemente puedes matar al boss para obtener este logro",
	["Shared_JustKillBossSingleTarget"] = "A nivel máximo, simplemente puedes matar al boss con habilidades de un solo objetivo para obtener este logro",
	["Shared_KillTheAddNow"] = "Mata a %s ahora",
	["Shared_MeetsCritera"] = "cumple los requisitos para",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "no fue golpeado",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "jugadores golpeados:",
	["Shared_PlayersWhoNeedAchievement"] = "Jugadores que necesitan el logro",
	["Shared_PlayersWhoStillNeedToGetHit"] = "Jugadores que todavía necesitan ser golpeados:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "Los siguientes jugadores han de ser resucitados para poder recibir el logro:",
	["Shared_ReportString"] = "Por favor, reporta la siguiente cadena de texto al autor de IAT",
	["Shared_Seven"] = "7",
	["Shared_Seventeen"] = "17",
	["Shared_SheCanNowBeKilled"] = "Ya puede ser matada",
	["Shared_Six"] = "6",
	["Shared_Sixteen"] = "16",
	["Shared_Ten"] = "10",
	["Shared_Thirteen"] = "13",
	["Shared_Three"] = "3",
	["Shared_Twelve"] = "12",
	["Shared_Twenty"] = "20",
	["Shared_Two"] = "2",
	["Shared_WasKilled"] = "fue matado",
	["ShrineOfTheStorm_LordStormsong"] = "A lo largo del encuentro, %s comenzará a lanzar %s lo cual invocará %s que perseguirán a los jugadores e intentando explotar tras el impacto. Para lograr este logro, nadie ha de entrar en contacto con ninguna de las bolas por lo que se tendrán que kitear a lo largo de todo el encuentro.",
	["ShrineOfTheStorm_Other"] = "El %s se recoge al principio de la mazmorra, en la primera sala. Si se recibe cualquier daño de escarcha se apagará el aliento del santuario así que se recomienda limpiar todos los pulls hasta el tercer boss, y entonces se coge el aliento. No se debe matar ningún boss ya que apagarían el aliento. Una vez encendidos los altares junto al tercer boss se recibirá el logro.",
	["ShrineOfTheStorm_VolZith"] = "Para conseguir el debuff %s se tendrá que nadar bajo el agua que hay justo antes del último boss hasta que se vean los Orbes del Vacío flotando alrededor para pillar uno. El debuff hará hostil a todos los jugadores durante 24 segundos tras los cuales desaparece durante 6 segundos el tiempo necesario para que el sanador pueda usar cds y sanar a todos la vida entera. No se pueden usar hechizos de área en el boss y se han de usar todas la mitigaciones personales posibles para ayudar al sanador.\n\n Después de que %s lance %s, se será teletransportado dentro del reino hundido donde habrá que matar rápidamente a los adds y entonces esperar entre 20 y 30 segundos para tener los cds disponibles. %s también estará lanzando %s, por lo que habrá que matar los ads antes de que lleguen al boss.",
	["SiegeOfBoralus_DreadCaptainLockwood"] = "%s intentará contínuamente huir de los jugadores usando %s a menos que sea ralentizada o enraizada. Como dice el logro, se la ha de dejar ralentizada o enraizada todo el combate para prevenir que huya usando %s.",
	["SiegeOfBoralus_Other"] = "Este logro está basado en profesiones necesarias para interactuar con varios objetos para invocar bosses. Para poder usar los objetos que hay a lo largo de las mazmorras se necesita un nivel de habilidad de 75 en Battle for Azeroth.\n\n (Herrería) %s - El martillo está bajando las escaleras que llevan al muelle en las coordenadas 58, 70.\n (Ingeniería) %s - El NPC se encuentra justo antes del 1er boss entre el fuego que hay a mano derecha.\n (Alquimia) %s - El 'Vial extraño' está encima de una mesa en las coordenadas 54, 74.",
	["SiegeOfBoralus_ViqGoth"] = "En el encuentro, %s usará %s lo que causará un bombardeo de %s alrededor del área. Durante esto, bastantes %s serán tirados al suelo a los cualos habrá que patear de vuelta al agua antes de matar al boss.",
	["TempleOfSethraliss_AvatarOfSethraliss"] = "Para este logro se ha de hacer /besar %s hasta que una de ellas se transforme en el 'Príncipe' que tiene el aspecto de %s. El 'Príncipe' no puede morir así que no hace falta preocuparse por usar habilidades de daño en área.",
	["TempleOfSethraliss_Merektha"] = "Para poder revelar la %s que está escondida encima de los huesos, habrá que usar %s, %s, %s u otras habilidades de daño posibles. Para que el huevo eclosione, hay que juntarse todos debajo del boss y esperar a que lance %s. Una vez que aparezca la %s se le puede matar y clickar el cuerpo. Tras un canalizado de 3 segundos se obtendrá el bufo del %s que hace conseguir el logro.\n\n Nota: El %s es posible que evada los ataques pero se teleportará al suelo pasados unos segundos. Si hay un DK en el grupo se podrá usar %s para bajar al %s, lo que no sólo evitará este error si no que también facilitará el posicionamiento.",
	["TempleOfSethraliss_Merektha_LootSnake"] = "Despoja a la %s ahora para completar el logro",
	["TempleOfSethraliss_Trash"] = "Para este logro se necesistan clases con habilidades de control de masas para el %s mientras se lleva los ojos de la serpiente cerca de ellos. A lo largo de toda la sala hay varios %s que intentarán robarnos el ojo y devolverlo a su sitio. Hay uno junto a cada ojo, uno entre los ojos y la calavera y algunos más en medio de la sala.\n\n Habilidades como %s, %s y %s son ideales. ya que puedes controlar los adds de un lado y entonces ignorarlos completamente.",
	["The_Motherlode_CoinOperatedCrowdPummeler"] = "Se ha de coger la %s justo antes de la sala del boss y lanzarla a %s después de comenzar el encuentro. %s lanzará %s durante toda la pelea así que habrá que interrumpir el hechizo y matarlo a él y al resto de adds lo más rapido posible ya que lanzarán grog, lo que emborrachará durante 10 segundos.",
	["The_Motherlode_MogulRazdunk"] = "Igual que los predecesores de este logro, éste es un logro personal que requiere que esquives muchas de las mecánicas del encuentro con el boss.",
	["TheEmeraldNightmare_Cenarius"] = "A nivel máximo, con suficiente DPS se puede matar el boss antes de que cualquier %s sea purificado.",
	["TheEmeraldNightmare_DragonsOfNightmare"] = "Hay 4 portales alrededor de la sala del boss. Todo el mundo debe atravesar los 4 portales y recoger 1 niebla de cada portal que dará un buff. Cuando todos los jugadores del grupo tengan los 4 buffos %s %s %s %s se podrá matar el boss. Hará falta dejar al menos un jugador en la sala del encuentro al principio del combate para tankear los bosses mientras los demás van ganando los buffos en los portales. Por último irán los que se habían quedado con los bosses.",
	["TheEmeraldNightmare_EleretheRenferal"] = "Para este logro, hay 7 huevos con un efecto rojo brillante que se encuentran alrededor de la sala. Para completar este logro han de ser destruidos los 7 huevos pasando por encima. Algunos huevos sólo pueden ser alcanzados usando %s o por jugadores usando efectos como %s, %s o %s. Una vez destruidos los 7 huevos ya se puede matar el boss,\n\n Nota: Si no se ve alguno de los huevos, reaparecerán tras pullear el boss.",
	["TheEmeraldNightmare_IllgynothHeartOfCorruption"] = "Espera a que aparezcan 20 %s matando los tentáculos. Una vez hayan vivos 20 %s, todo el mundo ha de estar enfrente del ojo y pegado a él. Entonces se han de hacer áreas para matar a todos los adds juntos. Una vez se hayan matado los 20 adds en 10 segundos y se abra el ojo, se puede matar el boss.",
	["TheEmeraldNightmare_Nythendra"] = "Durante la fase %s, aparecerán %s alrededor de los márgenes de la sala. Cuando aparezcan, los jugadores necesitan clickar en los bichos para aplastarlos. Una vez hayan sido aplastados 15 bichos se puede matar el boss. Aparecen 5 bichos en cada fase así que harán falta un mínimo de 3 fases %s para completar el logro.",
	["TheEmeraldNightmare_Ursoc"] = "Se han de matar los pulls a mano derecha justo antes de entrar en la cueva donde está el boss. Se libera a %s y se espera a que llegue a la sala del boss. Ahora se mata al boss mientras se le echa un ojo a %s para que permanezca vivo (se puede curar) y poder conseguir este logro.",
	["TheEmeraldNightmare_Xavius"] = "Para completar este logro, se necesitará un Demon Hunter para usar su habilidad %s. Alrededor de los márgenes exteriores de la sala del boss, aparecerá una %s en 3 puntos durante el combate. El Demon Hunter tendrá que usar su habilidad %s para encontrar el add y arrastrarlo al centro de la sala. Aparecerá un add en cada fase del combate, al 100-65%%, al 65%%-30%% y por debajo del 30%%. Una vez se hayan matado las 3 %s ya se podrá matar el boss.",
	["TheNighthold_ChronomaticAnomaly"] = "Este logro es más fácil de hacer en modalidad heróica. Jugadores aleatorios obtendrán el debuff %s. Estos jugadores tendrán que situarse encima de los círculos azules que hay alrededor de la sala del boss (junto a la fuente) hasta que se acabe el debuff %s. Cuando expire se podrá ver aparecer un haz de luz vertical en la localización donde explotó %s. Cuando al menos 8 círculos de alrededor de la sala tengan su haz de luz vertical se podrá matar al boss.",
	["TheNighthold_Elisande"] = "Para este logro se necesitará invocar la mascota %s antes de pullear el boss.\n\n Entonces habrá que esperar a que aparezcan %s y %s y matarlos uno encima del otro para que las cúpulas roja y azul queden superpuestas. Lo siguiente es llevar la mascota %s dentro de las cúpulas solapadas que soltaron al morir los elementales. Esto permitirá hacer aparecer el %s que ha de ser matado. Con el add muerto ya se puede matar el boss.",
	["TheNighthold_Guldan"] = "Durante la fase 2, hay que agruparse y esperar a que aparezcan los %s. Los ojos usarán %s entre ellos para hacer aparecer más y más ojos. Una vez hayan aparecido al menos 16 %s, hay que matarlos todos con menos de 3 segundos de diferencia entre cada muerte y entonces matar el boss.",
	["TheNighthold_HighBotanistTelarn"] = "Dispersas alrededor del área del boss hay Frutas Misteriosas. Para obtener este logro, todos los jugadores tendrán que comer una de esas frutas antes de pullear al boss y no morir durante el encuentro. La fruta misteriosa le da al jugador el debuff %s. A nivel máximo sólo hay que matar rápidamente al boss.\n\\m Nota: Hay que ser al menos 10 jugadores para completar este logro.",
	["TheNighthold_Krosus"] = "Para completar este logro hay que dejar caer al agua 15 %s cuando se rompe el puente. A nivel máximo no hace falta tapar ninguna %s para maximizar el número de %s que caen al agua.\n\n Nota: El número de %s que aparecen se incrementa cuantos más jugadores hay en el grupo.",
	["TheNighthold_Skorpyron"] = "A nivel máximo, hay que estar el grupo entero en el círculo central de la sala y matar el boss antes de que lance %s.",
	["TheNighthold_StarAugurEtraeus"] = "Para este logro, hará falta arrastrar al add %s que se haya en el exterior del edificio a la sala del boss.\n\n Hará falta hacer dps al boss hasta llegar al 30%% sin dañar al add. El add se transformará en un %s y entonces ya se podrá matar el add y después el boss.",
	["TheNighthold_Tichondrius"] = "A nivel máximo, sólo hay que matar al boss antes de que lance %s.\n\n Nota: Este logro es personal.",
	["TheUnderrot_ElderLeaxa"] = "Las habilidades de %s aplican a los jugadores %s cuando reciben daño de hechizos. Esto significa que se han de interrumpir todas sus habilidades y esquivarlas para prevenir que lance ese debuff.\n\n Para hacer más fácil el logro, se puede poner el sanador como dps para tener una interrupción extra y matar a la boss más rápido.",
	["TheUnderrot_SporecallerZancha"] = "%s está en la esquina superior izquierda de la sala. Para activarlo se tendrá que hacer que el boss lance %s en esa dirección.\n\n Nota: Si %s evade los ataques entonces se ha de ir al centro de la sala y él se teleportará en breve ahí.",
	["TheUnderrot_UnboundAbomination"] = "Los charcos de %s se pueden unir ocasionalmente en un add %s que fijará a un jugador aleatorio. Se ha de matar el boss sin que muera ninguna %s. Esto se hace fácilmente corriendo en círculo cuando un add te siga.\n\n Se puede hacer uso de habilidades de control de masas para ralentizarlas. Importante revisar los talentos, abalorios y rasgos de azerita para no matar accidentalmente a las esporas.",
	["TolDagor_KnightCaptainValyri"] = "Para este logro se ha de tanquear el boss en medio de la sala y los otros 4 jugadores han de mover los barriles cerca de %s, se han de alejar del fuego:\n %s - Este hechizo se lanza debajo de los jugadores. Sólo se ha de mover el barril lejos.\n %s - Cuando %s lance este hechizo, se tendrán que mover los barriles lejos de a donde esté mirando el boss.\n %s - Cuando un jugador tenga este debuff debe alejarse del barril enseguida y esperar a que se dispeleé.",
	["TolDagor_OverseerKorgus"] = "Al poco de comenzar el encuentro, %s dispara %s rondas a cada jugador y acumula %s. Cada vez que un jugador se mueve le afecta cada vez más hasta que el jugador queda aturdido durante 8 segundos. El grupo entero ha de hacer esto al comienzo del encuentro que es cuando menos habilidades hay que esquivar.",
	["TombOfSargeras_DemonicInquisition"] = "Hay que bajar el boss a alrededor del 20%%. Ahora cuando %s alcance los 100 de energía lanzará %s, así que toda la banda tendrá que atacarlo para alcanzar el máximo de tormento muy rápido.\n\n Una vez esté todo el grupo al máximo de tormento ya se puede matar el boss.",
	["TombOfSargeras_Goroth"] = "Para este logro han de juntarse los dps rango y los sanadores para que %s haga aparecer los %s en línea recta desde donde está. Los que sean marcados con %s tendrán que esconderse detrás de los pilares para que la estrella colisiones con los %s y los destruya.\n\n Una vez han sido destruidos 30 %s ya se puede matar el boss.",
	["TombOfSargeras_Harjatan"] = "Para hacer aparecer el %s alguien de la banda ha de usar el juguete %s.\n\n Se ha de usar el juguete al principio del combate, hacer foco al %s, y después de matarlo acabar con el boss.",
	["TombOfSargeras_MistressSasszine"] = "Para completar este logro, hará falta alimentar con los items de más abajo a %s en sus %s durante la Fase 2 (70%%) del comabte.\n\n 'Esencia de hidra' se obtiene cuando un jugador que ha tapado la trayectoria de %s entra en contacto con el círculo exterior de las %s.\n 'Salsa de tinta' se obtiene cuando un jugador que ha tapado el parche de %s entra en contacto con el círculo exterior de las %s.\n 'Condimento de jugador' se obtiene cuando un jugador muere en el círculo interior de las %s.\n 'Filete de anguila' se obtiene cuando un %s es absorvido dentro del círculo exterior de las %s.\n 'Filete de múrloc' se obtiene cuando un %s es absorvido dentro del círculo exterior de las %s.\n\n Nota: El %s y el %s necesitan estar alrededor del 10%% de vida antes de que sean absorvidos dentro de las %s. El %s sólo aparece durante la fase 1 así que no se puede pasar el boss a la fase 2 hasta que al menos haya aparecido 1 de estos adds.",
	["TrialOfValor_Guarm"] = "Para este logro, un jugador tendrá que coger el %s que hay junto al boss al inicio del combate. Este hueso hay que pasarlo por los 3 alientos de colores del boss (%s, %s, %s).\n\n Nota: No se puede hacer nada de lo siguiente mientras se lleva el hueso o se caerá.\n No usar ninguna habilidad.\n No recibir daño de %s.\n Morir mientras se lleva el hueso.\n\n Se necesitará un jugador para cada color de aliento. Cuando un jugador haya recibido un aliento, tendrá que soltar el hueso para que lo coja otro jugador. Una vez se hayan recibido los 3 alientos mientras se lleva el juguete del mordedor ya se podrá matar el boss.",
	["TrialOfValor_Helya"] = "A nivel máximo, este logro se puede hacer fácilmente en solitario. Sólo mata al boss sin tener el debuff %s. Esto se hace asegurándose de matar al add %s antes de matar al boss.",
	["TrialOfValor_Odyn"] = "Para este logro hay que llegar a la fase 2 matando a %s y a %s. Lo siguiente es esperar a que el boss lance %s, lo que iluminará las runas del suelo y aparecerán adds con sus correspondiente runas encima de la cabeza. Se ha de recordar el orden en que se encienden las runas del suelo y matar los adds correspondientes en sus runas en el orden en que éstas se encendieron.\n\n Una vez se cumplan los requisitos del logro se ganará el buffo %s lo que significará que ya se puede matar el boss.",
	["Uldir_Fetid_Devourer_Tactics"] = "Cada cuarto ataque cuerpo a cuerpo el boss lanzará %s en el objetivo más cercano del tanque actual, un golpe que ocasiona daño físico igual al 300% de un ataque cuerpo a cuerpo estándar.\n\n Cada jugador debe de ser golpeado, y es recomendado usar mitigaciones personales cuando eso ocurra. La pelea en si no es tan difícil, pero se han de priorizar a las personas sin mitigaciones personales antes de que el boss se enfurezca al 50%% (%s)\",",
	["Uldir_GHuun_Tactics"] = "Para este logro se tendrán que hacer grupos de 3 personas para hacer la %s: 2 dps + 1 sanador para curarles.\n\n Si se tiene un grupo muy pequeño se tendrán que invitar a más personas para que ayuden a matar los adds.",
	["Uldir_MOTHER_Tactics"] = "Para introducir el \"código de acceso\" se tendrá que hacer click en los botones de cada cámara en un orden específico que se asigna al azar para cada grupo. El orden puede ser 321, 213, 231 o combinaciones similares.\n\n Se comprueba si el botón de la primera cámara para de parpadear y entonces se envía un grupo de 2-3 dps y un sanador a clickar los botones de la segunda y tercera cámara. Si los botones son pulsados en la secuencia correcta, pararán todos de parpadear y ya no se podrán pulsar más. Una vez esto hecho ya se puede matar al boss y obtener el logro.",
	["Uldir_Mythrax_Tactics"] = "Desde Noviembre 2018: El logro ya funciona tal y como estaba descrito.\n\n Eso hace el logro mucho más fácil, ya que sólo has de coger orbes que tú produzcas.",
	["Uldir_Taloc_Tactics"] = "Para este logro se han de recolectar 4 %s mientras el Ascensor está bajando en la fase 2.\n\n Las posiciones de los orbes parecen ser aleatorias, sin embargo un Cazador de Demonios puede recogerlos todos fácilmente usando %s y %s",
	["Uldir_Vectis_Tactics"] = "La IAT_142148 está localizada abajo de la plataforma justo antes de ir a IAT_134442.\n\n Después de que ella obtenga el debuff %s se la puede matar y entonces una vez muerto el boss se recibirá el logro.\",",
	["Uldir_ZekVoz_Tactics"] = "Este logro es bastante fácil, sin embargo se tendrá que usar el IAT_64482 después de que IAT_135129 desaparezca en la fase 2. El puzzle se activará la próxima vez que aparezca IAT_135129 (la segunda vez), lo que ayudará a los sanadores con las curas y el maná (no se lidiará con la mecánica hasta pasado 1 minuto extra).\n\n El %s hará de 25k a 35k de daño en cualquier sitio, así que hay que asegurarse de esquivar las áreas lo más posible para no saturar a los sanadores.",
	["Uldir_ZulReborn_Tactics"] = "Este logro es bastante sencillo ya que nadie tiene que pisar el anillo interior de la plataforma. Unos consejos para el encuentro:\n\n Los tanques deberán coger todos los adds y juntarlos para que los dps melé puedan hacer daño en área.\n Los dps rango han de hacer daño al boss 24/7 y no deben cambiar a ningún add a menos que los melés tengan problemas para matarlos a tiempo.\n Si se tienen 2 sacerdotes en el grupo se tendrían que asignar en posiciones distintas (izquierda y derecha fuera del grupo) para que ambos lados estén cubiertos cuando aparezcan los Esbirros de Zul.\n Al 40%% IAT_138967 empujará atrás a todo el mundo, así que hay que posicionarse cerca de una pared para no caerse de la plataforma.\"",
	["WaycrestManor_GorakTul"] = "Durante el %s encuentro, el boss lanzará periódicamente %s el cual es necesario para quemar los cuerpos de %s para que no resuciten. Cuando el boss lance %s e invoque al tercer add habrá que matarlos a los tres, y entonces usar rápidamente %s para quemar sus 3 cuerpos de golpe (haced el encuentro a melé para evitar que el boss salte).",
	["WaycrestManor_Other"] = "Este es un logro basado en profesiones donde has de interactuar con objetos para invocar bosses. Para poder usar dichos objetos a lo largo de las mazmorras, es necesario un mínimo de nivel 75 de habilidad en Battle for Azeroth.\n\n (Peletería) %s - El mapa para invocar el boss se encuentra en la sección de caza  de la Mansión, en una esquina bajo un timón.\n (Sastrería) %s - El '%s' (un rollo de tela) está en el Salón del Banquete, en el piso superior.\n (Herboristería) %s - La '%s' está en la fuente de la zona abierta donde está %s.\n (Inscripción) %s - El '%s' está en una librería en un pasillo paralelo a donde está el boss de las hermanas, en la parte izquierda justo antes de bajar a la bodega.\n (Cocina) %s - El vino está en la bodega, junto a unas barricas de vino.",
	["WaycrestManor_SoulboundGoliath"] = "%s obtiene un bufo que se acumula cada 2 segundos llamado %s . Así que para conseguir este logro habrá que ir paseando al boss a través de los parches de fuego de %s que aparecerán en el área de combate para mantenerle bajas las acumulaciones de %s  (por debajo de 12).",	  
}

if(GetLocale() == "esES") then
    core:RegisterLocale('esES', baseLocale)
else
    core:RegisterLocale('esMX', baseLocale)
end