local PlayerFormat = {
	VerifiedBadge = utf8.char(0xE000),
	PlusBadge = utf8.char(0xE003),
}

function PlayerFormat.GetVerifiedBadge(player: Player): string
	return if player.HasVerifiedBadge then PlayerFormat.VerifiedBadge else ""
end

function PlayerFormat.GetPlusBadge(player: Player): string
	return if player.HasRobloxSubscription then PlayerFormat.PlusBadge else ""
end

function PlayerFormat.GetBadges(player: Player): string
	if player.HasVerifiedBadge and player.HasRobloxSubscription then
		return `{PlayerFormat.VerifiedBadge} {PlayerFormat.PlusBadge}`
	end

	return if player.HasVerifiedBadge then PlayerFormat.VerifiedBadge else PlayerFormat.GetPlusBadge(player)
end

function PlayerFormat.GetDisplayName(player: Player): string
	return if player.HasVerifiedBadge or player.HasRobloxSubscription
		then `{player.DisplayName} {PlayerFormat.GetBadges(player)}`
		else player.DisplayName
end

return table.freeze(PlayerFormat)
