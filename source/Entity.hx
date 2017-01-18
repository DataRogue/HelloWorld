package;


typedef HumanoidBody = {
    head: Limb,
    torso: Limb,
    lArm: Limb,
    rArm: Limb,
    lLeg: Limb,
    rLeg: Limb
}

typedef Limb = {
    bruised: Bool,
    broken: Bool,
    bleeding: Bool,
    bandaged: Bool,
    regenerating: Bool,
    invalid: Bool,
    resistance: Float
}

typedef CombatStats = {
    accuracy: Float,
    might: Float,
    baseResistance: Float
}

typedef Attributes = {
    ferocity: Int,
    guile: Int,
    wisdom: Int
}

class Entity
{
    public var name: String;
    public var body: HumanoidBody;
    public var stats: CombatStats;
    public var boons: Array<Boons>;
    public var banes: Array<Boons>;
    public var attributes: Attributes;

	public function new(struct:Dynamic)
	{
        loadFromStruct(struct);
	}

    public function loadFromStruct(struct:Dynamic){
        name = struct.name;
        body = struct.body;
        stats = struct.stats;
        boons = boonStringToBoon(struct.boons);
        banes = boonStringToBoon(struct.banes);
        attributes = struct.attributes;
    }

    public function boonStringToBoon(boonStrings:Array<String>):Array<Boons>{
        return new Array<Boons>();
    }
}
