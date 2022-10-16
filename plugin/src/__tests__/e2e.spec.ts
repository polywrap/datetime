import { PolywrapClient } from "@polywrap/client-js";
import { dateTimePlugin } from "../";

describe("e2e", () => {

  let client: PolywrapClient;
  const uri = "ens/datetime.polywrap.eth";

  beforeAll(() => {
    // Add the dateTimePlugin to the PolywrapClient
    client = new PolywrapClient({
      plugins: [
        {
          uri: uri,
          plugin: dateTimePlugin({})
        }
      ]
    });
  });

  it("retrieves current datetime", async () => {
    const result = await client.invoke({
      uri,
      method: "currentTimestamp"
    });

    if (!result.ok) throw result.error;
    expect(typeof result.value).toBe("string");
    expect(result.value).toMatch(/^\d+$/);
  });
});
