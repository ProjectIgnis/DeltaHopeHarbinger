--超重魔獣キュウ－B
local s,id=GetID()
function s.initial_effect(c)
	c:AddSetcodesRule(0x9a)
	--synchro summon
	Synchro.AddProcedure(c,nil,1,1,Synchro.NonTunerEx(Card.IsSetCard,0x9a),1,99)
	c:EnableReviveLimit()
	--defense attack
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_DEFENSE_ATTACK)
	e2:SetValue(1)
	c:RegisterEffect(e2)
	--
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_UPDATE_DEFENSE)
	e3:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCondition(s.sccon)
	e3:SetValue(s.adval)
	c:RegisterEffect(e3)
end
s.listed_series={0x9a}
function s.sccon(e)
	return not Duel.IsExistingMatchingCard(Card.IsType,e:GetHandlerPlayer(),LOCATION_GRAVE,0,1,nil,TYPE_SPELL+TYPE_TRAP)
end
function s.adval(e,c)
	return Duel.GetMatchingGroupCount(s.ctfilter,c:GetControler(),0,LOCATION_MZONE,nil)*900
end
function s.ctfilter(c)
	return (c:GetSummonType()&SUMMON_TYPE_SPECIAL)==SUMMON_TYPE_SPECIAL
end
