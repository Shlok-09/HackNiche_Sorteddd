import { useState } from 'react';
import { motion } from 'framer-motion';
import { exploreWorlds } from '../data/dummy';
import { staggerContainer } from '../utils/motion';
import { ExploreCard } from '../components';
import { TypingText, TitleText } from '../components/CustomTexts';

const Explore = () => {
  const [active, setActive] = useState('world1');

  return (
    <section id="explore">
      <motion.div
        variants={staggerContainer}
        initial="hidden"
        whileInView="show"
        viewport={{ once: false, amount: 0.25 }}
        className={` mx-auto flex flex-col`}
      >
        <TypingText title="| The World" textStyles="text-center" />
        <TitleText
          title={<>Choose the world you want <br className="md:block hidden" /> to explore</>}
          textStyles="text-center"
        />
        <div className="mt-[50px] flex lg:flex-row flex-col min-h-[70vh] gap-5">
          {exploreWorlds.map((world, index) => (
            <ExploreCard
              key={world.id}
              {...world}
              index={index}
              active={active}
              handleClick={setActive}
            />
          ))}
        </div>
      </motion.div>
    </section>
  );
};

export default Explore;
